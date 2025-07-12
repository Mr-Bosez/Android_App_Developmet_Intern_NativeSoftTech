import 'package:flutter/material.dart';
import 'package:weather_application/data/model/forecast_list_model.dart';
import 'package:weather_application/ui/commonwidgets/custom_loader.dart';
class ForecastListItem extends StatelessWidget {
  final ForecastListModel forecastListModel;
  const ForecastListItem({super.key,required this.forecastListModel});

  @override
  Widget build(BuildContext context) {
    var parseDate=DateTime.parse(forecastListModel.currentTimestamp!);
    return Card(
      margin: EdgeInsets.only(left: 10,right: 10,top:10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        // side: BorderSide(width: 2,color: Colors.blue)
      ),
      elevation:5,
      color: Colors.grey[350],
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://openweathermap.org/img/wn/${forecastListModel.weatherModelList!.first.icon}@2x.png",filterQuality: FilterQuality.high,height: 40,width: 70,),
                Text("${parseDate.day.toString().padLeft(2,"0")}/${parseDate.month.toString().padLeft(2,'0')}"),
                Text("${parseDate.hour.toString().padLeft(2,"0")}/${parseDate.minute.toString().padLeft(2,'0')}"),
              ],
            ),
            SizedBox(width: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Type:${forecastListModel.weatherModelList!.first.weatherType} ,  ${forecastListModel.weatherModelList!.first.description}",style: TextStyle(fontSize: 17),),
                Text("Max:${forecastListModel.weatherMain!.maximumTep} ℃ , Min:${forecastListModel.weatherMain!.minimumTemp} ℃ ",style: TextStyle(fontSize: 16),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
