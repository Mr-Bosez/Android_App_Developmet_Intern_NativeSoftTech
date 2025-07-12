
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/controller/home/home_cubit.dart';
import 'package:weather_application/controller/home/states/home_states.dart';

import 'package:weather_application/core/routing/app_router.dart';
import 'package:weather_application/data/chooseLocation/country_list.dart';
import 'package:weather_application/data/chooseLocation/state_list.dart';
import 'package:weather_application/ui/commonwidgets/custom_loader.dart';
import 'package:weather_application/ui/commonwidgets/display_Grid_Widget.dart';
import 'package:weather_application/ui/commonwidgets/display_error.dart';
import 'package:weather_application/ui/commonwidgets/empty_widget.dart';
import 'package:weather_application/ui/commonwidgets/title_text_widget.dart';
@RoutePage()
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
          listener: (BuildContext context,HomeStates state){

          },
        builder: (BuildContext context,HomeStates state){
            return state.maybeWhen(
              displayCountries: (CountryList countryList){
                List<String>countriesList=countryList.countryData!.map((e)=>e.countryName!).toList();
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Choose Country'),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shadowColor:Colors.lightBlueAccent[100],
                                backgroundColor: Colors.lightBlueAccent,
                                side: BorderSide(
                                    color: Colors.green,
                                    width: 2
                                ),
                              ),
                              onPressed: (){
                                context.router.navigate(ForecastRoute());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text("Current location Forecast ⛅",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              )
                          ),
                          SizedBox(height: 10,),
                          TitleTextWidget(textToShow: "Which country do you want to check Forecast ?\n"),
                          DisplayGridWidget(listOfString: countriesList, onGridClicked: (String countryName){
                            final _homeCubit=context.read<HomeCubit>();
                            _homeCubit.getStates(countryName);
                          })

                        ],
                      ),
                    ),
                  ),
                );
              },
                displayStates: (StateList stateList){
                List<String> listOfStates=stateList.stateData!.map((e)=>e.stateName!).toList();
                return Scaffold(
                  appBar: AppBar(
                    title: Text('states'),
                    leading: IconButton(onPressed: (){
                      final _homecubit=context.read<HomeCubit>();
                      _homecubit.getCountriesAgain();
                    }, icon: Icon(Icons.arrow_back_rounded)),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        TitleTextWidget(textToShow: "Choose the state"),
                        DisplayGridWidget(listOfString: listOfStates , onGridClicked: (String stateName){
                          // context.router.navigate(const ForecastRoute());
                          context.router.navigate(ForecastRoute(stateName: stateName));


                        })
                      ],
                    ),
                  ),
                );
                
                },
              loading: (){
                return CustomLoader();
              },
                errorMessage: (String? error){
                return DisplayError(errorText: error!);
                },
                orElse: (){
                  return EmptyWidget();
                });
        },
      ),
    );
  }
}