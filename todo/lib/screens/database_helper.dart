import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/base/app_constants.dart';
import 'package:todo/base/loggerUtils.dart';
import 'package:path/path.dart';
import 'package:todo/model/taskModel.dart';


class DatabaseHelper{

  final _logger=LoggerUtils();
  final TAG='DatabaseHelper';

  static final DatabaseHelper _instance=DatabaseHelper._init();
  static DatabaseHelper get dbInstance=>_instance;

  DatabaseHelper._init();// Named constructor

  late Database _database;

  //Step-1 creation of DB

  Future<bool>createDbInLocalStorage() async{
    try{
      var dataBasePath=await getDatabasesPath(); //Returns the default path on the device where SQLite databases are stored.
      var path= join(dataBasePath,AppConstants.kDatabaseName); // Combines dataBasePath and the database name to form the full file path (e.g., .../databases/mydb.db).
      bool isDbExist=await databaseExists(path);
      if(!isDbExist){
        // copying the Database here
        await Directory(dirname(path)).create(recursive: true); // Extracts the directory part of the path (/databases/), excluding the file name and create the directory if it doesn't exist
        ByteData dbData=await rootBundle.load(join('assets/databases',AppConstants.kDatabaseName)); // Loads the binary file (the prebuilt DB) from your app's assets/ folder.
        List<int> dbSize=dbData.buffer.asUint8List(dbData.offsetInBytes,dbData.lengthInBytes); // Converts the ByteData into a List<int> which can be written to a file.
        await File(path).writeAsBytes(dbSize,flush: true);
        // File(path):Points to the location where the DB should be saved.
        //flush: true:Ensures all data is immediately written to disk, not just kept in memory.
      }
      _database =await openDatabase(path);
      return Future.value(true); //Indicates successful creation and opening of the DB.
    }
    catch(exception){
      return Future.error("Db copying failed $exception");
    }
  }

  //Step-2 Getting the list of tasks

  Future<List<TasksModel>> getTaskList()async{
    try{
      List<TasksModel> pendingTasks=[];//This list will be used to store all the fetched tasks from the database
      String query='select * from ${AppConstants.kDatabaseTableName}'; //creates a raw SQL query string that selects all rows from the tasks table.
      var queryResult=await _database.rawQuery(query); //Sends a raw SQL command to the database.  queryResult:A List<Map<String, dynamic>> where each map represents a row in the table.
      for (var currentRow in queryResult){     //currentRow is a map like:
                                              //       {
                                              //         "Id": 1,
                                              //   "TaskDescription": "Buy milk"
                                              // }
        int taskId=int.parse(currentRow['Id'].toString());
        String taskDescription=currentRow['TaskDescription'].toString();
        TasksModel tasksModel=TasksModel(id: taskId, taskDescription: taskDescription);
        pendingTasks.add(tasksModel);
      }
      return Future.value(pendingTasks);
    }
    catch(exception){
      return Future.error("Get task failed $exception");
    }
  }

  //Step-3 Inserting the tasks

  Future<int> insertTask(TasksModel taskmodel)async{
    int rowId=await _database.insert(AppConstants.kDatabaseTableName, taskmodel.taskMapper(),conflictAlgorithm:ConflictAlgorithm.replace);
    // taskmodel.taskMapper():Converts your TasksModel object into a map so it can be inserted into the database.
    //conflictAlgorithm: ConflictAlgorithm.replace: If a row with the same primary key already exists, this will replace the old one.
    return Future.value(rowId);
  }

  //Step-4 Updating the tasks

  Future<void> updateTasks(TasksModel taskmodel) async{
    await _database.update(
        AppConstants.kDatabaseTableName,
        taskmodel.taskMapper(),
        where:'Id=?',
        whereArgs: [taskmodel.id]);
  }

  //Step-5 Deleting the tasks

  Future<void> deleteTask (int taskId) async{
    await _database.delete(
      AppConstants.kDatabaseTableName,
      where:'Id=?',
      whereArgs: [taskId]
    );
  }
}