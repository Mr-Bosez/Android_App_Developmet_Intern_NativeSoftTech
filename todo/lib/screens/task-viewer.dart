import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/base/app_constants.dart';
import 'package:todo/base/loggerUtils.dart';
import 'package:todo/model/taskModel.dart';
import 'package:todo/screens/taskNotifier.dart';

import 'add_a_task.dart';

class TaskViewerScreen extends StatelessWidget{
   TaskViewerScreen({super.key});

  final _logger=LoggerUtils();
  final _TAG ='TaskViewerScreen';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppConstants.bgColor,
        title: Text('To Do use TODO ✒️',style: TextStyle(color:AppConstants.frontColor),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer<TaskNotifier>(
                    builder:(context,TaskNotifier taskNotifier,Widget ? child){
                      List<TasksModel> taskList=taskNotifier.userTaskList;
                      int totalCounter=taskNotifier.pendingTask;
                      return ListView.builder(
                        itemCount: totalCounter,
                          itemBuilder: (BuildContext context,int index){
                            TasksModel currentModel= taskList[index];
                            return Dismissible(
                                key: Key(currentModel.id.toString()),
                                direction: DismissDirection.startToEnd,
                                background: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.delete, color: Colors.white),
                                ),
                                onDismissed: (direction)=>taskNotifier.deleteTheTask(currentModel),
                                child: ListTile(
                                    title: Text(currentModel.taskDescription),
                                    trailing:Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen(
                                                oldTaskModel: currentModel,
                                                isTaskBeingModified: true,
                                              )));
                                            },
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: (){
                                              taskNotifier.deleteTheTask(currentModel);
                                            },
                                            icon: Icon(Icons.delete,color: Colors.red,)),
                                      ],
                                    )
                                ));
                          }
                      );
                    }
                ),
          ),
    //       ElevatedButton(
    //       onPressed: () async{
    //       final dbHelper= DatabaseHelper.dbInstance;
    //       bool isDbCopyFinished= await dbHelper.createDbInLocalStorage();
    //       _logger.log(TAG: _TAG, message: 'Database created $isDbCopyFinished');
    //
    // }, child: Text('press')
    // ),
    //       ElevatedButton(
    //           onPressed:()async{
    //             DatabaseHelper dbHelper= DatabaseHelper.dbInstance;
    //             List<TasksModel> tasks=await dbHelper.getTaskList();
    //             _logger.log(TAG:_TAG , message: 'list of tasks $tasks');
    //           } ,
    //           child:Text('get datalist')
    //       ),
    //       ElevatedButton(
    //           onPressed:()async{
    //             DatabaseHelper dbHelper= DatabaseHelper.dbInstance;
    //             TasksModel taskModel=TasksModel(id: 7, taskDescription: 'going to beach with her');
    //             int rowId=await dbHelper.insertTask(taskModel);
    //             _logger.log(TAG:_TAG , message: 'list of tasks $rowId');
    //           } ,
    //           child:Text('insert data')
    //       ),
    //       ElevatedButton(
    //           onPressed:()async{
    //             DatabaseHelper dbHelper= DatabaseHelper.dbInstance;
    //             TasksModel taskModel=TasksModel(id: 7, taskDescription: 'going to beach with hippo');
    //             await dbHelper.updateTasks(taskModel);
    //           } ,
    //           child:Text('update data')
    //       ),
    //       ElevatedButton(
    //           onPressed:()async{
    //             DatabaseHelper dbHelper= DatabaseHelper.dbInstance;
    //             await dbHelper.deleteTask(7);
    //           } ,
    //           child:Text('delete data')
    //       ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.bgColor,
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
          },

        child: Icon(Icons.add,color: AppConstants.frontColor),
      ),

    );
  }
}