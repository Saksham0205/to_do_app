import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem; // Updated parameter type

  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        tileColor: Colors.white,
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: todo.isDone ? Icon(Icons.check_box,color: Colors.green,) : Icon(Icons.check_box_outline_blank),
        title: Text(
          todo.todotext!,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            fontSize: 16,
            color: Colors.grey.shade800,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            onDeleteItem(todo.id!);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            padding: EdgeInsets.all(6),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

