import 'package:emirs_todo_app/config/config.dart';
import 'package:emirs_todo_app/screens/screens.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.light,
    );
  }
}
