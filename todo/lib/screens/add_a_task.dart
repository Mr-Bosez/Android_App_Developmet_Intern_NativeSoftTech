import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/base/app_constants.dart';
import 'package:todo/model/taskModel.dart';
import 'package:todo/screens/taskNotifier.dart';

class AddTaskScreen extends StatelessWidget{
  final String errorMsg='Enter the description';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController taskController=TextEditingController();
  final TasksModel ? oldTaskModel;
  final bool isTaskBeingModified;

  AddTaskScreen({super.key, this.oldTaskModel, this.isTaskBeingModified=false,});


  @override
  Widget build(BuildContext context) {

    if(isTaskBeingModified){
      taskController.text=oldTaskModel!.taskDescription;
    }
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                  builder:(BuildContext context){
                    if(isTaskBeingModified){
                      return Text('What do you want to do instead of ${oldTaskModel!.taskDescription}',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
                    }
                    else{
                      return Text('Add some tasks',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),);
                    }

                  }
                  ),

              SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: taskController,
                  validator: (String ? input){
                    if(input!=null && input.isNotEmpty){
                      return null;
                    }else{
                      return errorMsg;
                    }
                  },
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter the description',
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.purple,width: 6,style: BorderStyle.solid
                        )
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    //   borderSide: BorderSide(
                    //     color: Colors.blue,width: 3,style: BorderStyle.solid
                    //   )
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    //   borderSide: BorderSide(
                    //     color: Colors.orange,width: 3,style: BorderStyle.solid
                    //   )
                    // ),
                    // errorBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    //   borderSide: BorderSide(
                    //     color: Colors.red,width: 3,style: BorderStyle.solid
                    //   )
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  elevation: 1,
                  backgroundColor: AppConstants.bgColor,
                ),
                  onPressed: (){
                    if(_formKey.currentState!=null && _formKey.currentState!.validate()){
                      if(isTaskBeingModified==true && oldTaskModel!=null){
                        Provider.of<TaskNotifier>(context,listen: false).modifyTaskInList(oldTaskModel!,taskController.text );
                      }
                      else{
                        Provider.of<TaskNotifier>(context,listen: false).addTaskToList(taskController.text);
                      }

                      Navigator.pop(context);
                    }
                  },
                  label: isTaskBeingModified? Text('Update task',style: TextStyle(fontSize: 18,color: AppConstants.frontColor)) :Text('Add Task',style: TextStyle(fontSize: 18,color: AppConstants.frontColor)),
                icon:Icon(Icons.add,size: 20,color: AppConstants.frontColor,) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}