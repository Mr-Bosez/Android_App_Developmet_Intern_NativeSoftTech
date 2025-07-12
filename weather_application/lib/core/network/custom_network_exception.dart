//2
import 'package:weather_application/utils/logger_utils.dart';

import 'network_error_type_enum.dart';

class CustomNetworkException implements Exception {
  // final Map<String, dynamic>? errorResponseJsonMap;
  final String? errorResponseJsonMap;
  final String? errorMessage;
  final int? errorCode;
  final NetworkErrorType networkErrorType; //obj
  final TAG = "CustomNetworkException";
  final logger = LoggerUtils();
  bool? isTokenRefreshed = false;

  CustomNetworkException({
    this.errorResponseJsonMap,
    this.errorCode,
    required this.errorMessage,
    required this.networkErrorType,
    this.isTokenRefreshed});

  @override
  String toString() {
    return "Error occurred with message $errorMessage and status code $errorCode" ;
  }
}