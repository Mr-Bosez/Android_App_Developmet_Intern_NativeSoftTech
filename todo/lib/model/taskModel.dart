class TasksModel {
  int id;
  String taskDescription;
  TasksModel({required this.id,required this.taskDescription});

  Map<String,dynamic> taskMapper(){
    return{
      'Id':this.id,
      'TaskDescription':this.taskDescription
  };
}

  @override
  String toString() {
    return 'TasksModel{id: $id, taskDescription: $taskDescription}';
  }
}