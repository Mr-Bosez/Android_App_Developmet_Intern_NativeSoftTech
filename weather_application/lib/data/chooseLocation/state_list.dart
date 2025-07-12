import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_application/data/chooseLocation/state_data.dart';

part 'state_list.freezed.dart';
part 'state_list.g.dart';

@freezed
class StateList with _$StateList{
  @JsonSerializable(explicitToJson:true)
  const factory StateList({
    required String?status,
    @JsonKey(name:"data")
    required List<StateData>? stateData,

})=_StateList;
  factory StateList.fromJson(Map<String,dynamic>json)=>_$StateListFromJson(json);
}