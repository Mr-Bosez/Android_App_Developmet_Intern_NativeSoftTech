//3
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_application/utils/logger_utils.dart';

import '../app_constants/app_constants.dart';
import 'custom_network_exception.dart';
import 'network_error_type_enum.dart';

/// Interceptor for the app
class AppInterceptor extends Interceptor {
  final String TAG = "AppInterceptor";
  final _logger = LoggerUtils();

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (isNullEmptyOrFalse(response.data)) {
      handler.next(response);
      return;
    }

    // If needed, use the message for logging/debugging
    // final message = response.data["message"];
    handler.next(response);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      final newError = DioException(
        requestOptions: error.requestOptions,
        response: error.response,
        type: error.type,
        error: CustomNetworkException(
          errorMessage: 'Could not connect with server. Please try again.',
          networkErrorType: NetworkErrorType.SERVER_CONNECTION_ERROR,
          errorCode: error.response?.statusCode,
          errorResponseJsonMap: error.response?.data,
        ),
      );
      return handler.reject(newError);
    }else if (error.type == DioExceptionType.unknown && error.error is SocketException) {
      handler.reject(
        DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          type: error.type,
          error: CustomNetworkException(
            errorMessage: 'No internet connection',
            networkErrorType: NetworkErrorType.NO_INTERNET,
            errorCode: error.response?.statusCode,
            errorResponseJsonMap: error.response?.data,
          ),
        ),
      );
      return;
    }

    else if (error.type == DioExceptionType.badResponse) {
      try {
        final customError = await _getErrorObject(error.response);
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            response: error.response,
            type: error.type,
            error: customError,
          ),
        );
      } catch (e) {
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            response: error.response,
            type: error.type,
            error: e,
          ),
        );
      }
      return;
    }


    _logger.log(TAG: TAG, message: "Rejecting because of error");
    handler.reject(error);
  }

  Future<CustomNetworkException?> _getErrorObject(Response? response) async {
    final responseData = response?.data;
    if (response != null) {
      switch (response.statusCode) {
        case 401:
          _logger.log(TAG: TAG, message: "Probably token has expired and we would refresh it from server");
          break;

        case 403:
          _logger.log(TAG: TAG, message: "Access denied or forbidden resource");
          return CustomNetworkException(
            errorMessage: responseData['message'] ?? ApplicationConstants.kWentWrongMessage,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorType.RESPONSE_ERROR,
            errorResponseJsonMap: null,
          );

        case 404:
          _logger.log(TAG: TAG, message: "Endpoint not found");
          return CustomNetworkException(
            errorMessage: ApplicationConstants.k404Message,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorType.INVALID_ENDPOINT_ERROR,
            errorResponseJsonMap: null,
          );

        default:
          if (responseData != null && responseData is Map) {
            _logger.log(TAG: TAG, message: "Inside response data is map and status code ${response.statusCode}");
            return CustomNetworkException(
              errorMessage: responseData['message'] ?? ApplicationConstants.kWentWrongMessage,
              errorCode: response.statusCode,
              networkErrorType: NetworkErrorType.RESPONSE_ERROR,
              errorResponseJsonMap: null,
            );
          } else {
            _logger.log(TAG: TAG, message: "Inside error response when no status code matches");
            return CustomNetworkException(
              errorMessage:
              'Error occurred while communicating with server. StatusCode: ${response.statusCode}',
              networkErrorType: NetworkErrorType.RESPONSE_ERROR,
              errorCode: response.statusCode,
              errorResponseJsonMap: null,
            );
          }
      }
    }
    return null;
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map || o is List) {
    return o.isEmpty;
  }
  return o == null || o == false || o == "";
}
