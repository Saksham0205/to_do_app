import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,size: 35,color: Colors.white,),
        actions: [
          Padding(
            padding: EdgeInsets.all(5), // Adjust the value as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("assets/Saksham.jpg"),
            ),
          ),
        ],
        title: Text("To-Do",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff121212),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff121212),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child:
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                prefixIcon: Icon(Icons.search,color: Colors.black,size: 25,),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 25,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: "Search",
              ),
            ),
          ),
            ),
          Expanded(

            child: ListView(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),child:
              Container(
                child: Text(
                  "All tasks",
                  style: TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.w400),
                ),
              ),
              ),

              ToDoItem(),
              ToDoItem(),
              ToDoItem(),
              ToDoItem(),

            ],
          ),
          ),

        ],

      ),

    );
  }
}
