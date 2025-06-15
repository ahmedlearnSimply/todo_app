import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do Tasks")),
      body: Center(),
      // body: Padding(padding: const EdgeInsets.all(16.0), child: TasksItems(tasks: [],onTap: (){

      // },)),
    );
  }
}
