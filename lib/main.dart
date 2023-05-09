import 'package:flutter/material.dart';
import 'package:work_tasks/screens/auth/login.dart';
import 'package:work_tasks/screens/tasks.dart';
import 'package:work_tasks/whatsapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Works Tasks',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      debugShowCheckedModeBanner: false,
      home: Whatsapp() ,
    );
  }
}


