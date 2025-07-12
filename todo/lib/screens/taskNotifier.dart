import 'package:flutter/cupertino.dart';
import 'package:todo/base/loggerUtils.dart';
import 'package:todo/model/taskModel.dart';
import 'package:todo/screens/database_helper.dart';

class TaskNotifier extends ChangeNotifier{
  final List<TasksModel> _taskList=[];
  int _taskCounter=0;


  List<TasksModel> get userTaskList => _taskList; // encapsulation
  int get pendingTask=> _taskCounter;

  final _loggerUtils = LoggerUtils();
  final _TAG = 'TaskNotifier';

  final _dbHelper =DatabaseHelper.dbInstance;

  TaskNotifier(){
    initDatabase();
  }

  Future<void> initDatabase() async{
    bool isDbCreated=await _dbHelper.createDbInLocalStorage();
    if(isDbCreated){
      List<TasksModel> pendingTasks=await _dbHelper.getTaskList();
      if(pendingTasks.isNotEmpty){
        for(var currentTask in pendingTasks){
          _taskList.add(currentTask);
          _taskCounter++;
        }
      }
    }
    notifyListeners();

  }

  Future<void> addTaskToList (String description)async{
    _taskCounter++;
    TasksModel tasksModel=TasksModel(id: _taskCounter, taskDescription: description);
    _dbHelper.insertTask(tasksModel);
    _taskList.add(tasksModel);
    notifyListeners();
    _loggerUtils.log(TAG: _TAG, message: tasksModel.toString());
  }

  Future<void> modifyTaskInList(TasksModel oldTaskModel,String newDescription) async {
    int oldTaskIndex=_taskList.indexOf(oldTaskModel);
    if(oldTaskIndex!=-1){
      int taskId=oldTaskModel.id;
      TasksModel updateTaskModel=TasksModel(id:taskId , taskDescription: newDescription);
      _taskList[oldTaskIndex]=updateTaskModel;
      await _dbHelper.updateTasks(updateTaskModel);
      notifyListeners();
      _loggerUtils.log(TAG: _TAG, message: 'modified task ${_taskList[oldTaskIndex]}');
    }
  }

  Future<void> deleteTheTask(TasksModel taskModelToDelete) async {
    _taskCounter--;
    int indexOfTaskToBeDeleted = _taskList.indexOf(taskModelToDelete);
    _taskList.removeAt(indexOfTaskToBeDeleted);
    await _dbHelper.deleteTask(indexOfTaskToBeDeleted+1);
    notifyListeners();
    _loggerUtils.log(TAG: _TAG, message: "Successfully deleted the task");
  }
}