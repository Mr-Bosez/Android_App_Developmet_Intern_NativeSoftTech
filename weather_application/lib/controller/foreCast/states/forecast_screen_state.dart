import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/forecast_main_model.dart';
import '../../../data/model/graph_point.dart';

part 'forecast_screen_state.freezed.dart';

@freezed
class ForecastScreenStates with _$ForecastScreenStates{
  const factory ForecastScreenStates.displayGraph(List<GraphPoint>points,ForecastMainModel forecastMainModel)=_DisplayGraph;
  const factory ForecastScreenStates.loading()=_Loading;
  const factory ForecastScreenStates.error()=_Error;
}