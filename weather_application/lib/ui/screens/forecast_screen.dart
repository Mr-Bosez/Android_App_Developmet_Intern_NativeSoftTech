import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/foreCast/forecast_cubit.dart';
import 'package:weather_application/controller/foreCast/states/forecast_screen_state.dart';
import 'package:weather_application/data/model/forecast_list_model.dart';
import 'package:weather_application/ui/commonwidgets/custom_loader.dart';
import 'package:weather_application/ui/commonwidgets/display_error.dart';
import 'package:weather_application/ui/commonwidgets/forecast_list_item.dart';
import 'package:weather_application/ui/commonwidgets/title_text_widget.dart';

import '../../data/model/forecast_main_model.dart';
import '../../data/model/graph_point.dart';
@RoutePage()
class ForecastScreen extends StatelessWidget{
  final String? stateName;
  const ForecastScreen({super.key,this.stateName});

  SideTitles get xAxisTitle=>SideTitles(
    showTitles: true,
    getTitlesWidget: (double value,TitleMeta meta){
      String titleText="";
      switch(value.toInt()){
        case 1:{
          titleText="+3H";
        }
        break;
        case 2:{
          titleText="+6H";
        }
        break;
        case 3:{
          titleText="+9H";
        }
        break;
        case 4:{
          titleText="+12H";
        }
        break;
        case 5:{
          titleText="+15H";
        }
        break;


      }
      return Text(titleText);

    }
  );

  List<BarChartGroupData>getGraph(List<GraphPoint>points){
    List<BarChartGroupData>barChartDataList=[];
    for( var currentChartData in points){
      BarChartGroupData barChartGroupData=BarChartGroupData(
          x:currentChartData.x.toInt(),
        barRods:  [
          BarChartRodData(toY: currentChartData.y,
          color: Colors.redAccent,
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(2),
          width: 20
          ),
        ]
      );
      barChartDataList.add(barChartGroupData);
    }
    return barChartDataList;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create:(BuildContext context)=>ForecastCubit(stateName),
      child:BlocConsumer<ForecastCubit,ForecastScreenStates>(
        listener: (BuildContext context,ForecastScreenStates states){

        },
        builder: (BuildContext context,ForecastScreenStates states){
          return states.when(
              displayGraph: (List<GraphPoint>points,ForecastMainModel forecastMainModel){
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Weather Forecast"),
                    backgroundColor: Colors.white,
                  ),
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              TitleTextWidget(textToShow: "Next 15H forecast 🌦️"),
                              SizedBox(height: 20,),
                              AspectRatio(
                                aspectRatio: 2,
                                child: BarChart(
                                    BarChartData(
                                        barGroups: getGraph(points),
                                        maxY: 400,
                                        titlesData: FlTitlesData(
                                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                          bottomTitles: AxisTitles(sideTitles:xAxisTitle),
                                        )
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Forecast",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: forecastMainModel.forecastList!.length,
                            itemBuilder: (BuildContext context,int index){
                            ForecastListModel  currentModel=forecastMainModel.forecastList![index];
                              return ForecastListItem(forecastListModel: currentModel);
                            }
                        )
                      ],
                    ),
                  ),
                );
              },
              loading: ()=>CustomLoader(),
              error: ()=>DisplayError()
          );
        }
      ) ,
    );
  }
}