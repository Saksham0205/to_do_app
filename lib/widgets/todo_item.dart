import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key});

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        tileColor: Colors.white,
        onTap: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: Icon(Icons.check_box,color: Colors.green,),
        title: Text("Check mail",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 16,color: Colors.grey.shade800),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          padding: EdgeInsets.all(6),

          child: Icon(Icons.delete,color: Colors.white,),
        ),
      ),
    );
  }
}
