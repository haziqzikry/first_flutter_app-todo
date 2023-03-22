import 'package:flutter/material.dart';
import 'todo_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const TodoListPage(),
    );
  }
}
