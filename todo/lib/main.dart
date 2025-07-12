import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/task-viewer.dart';
import 'package:todo/screens/taskNotifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>TaskNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskViewerScreen(),
      ),
    );
  }
}
