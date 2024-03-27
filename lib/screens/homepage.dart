import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.TodoList();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 35, color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.all(5), // Adjust the value as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("assets/Saksham.jpg"),
            ),
          ),
        ],
        title: Text(
          "To-Do",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff121212),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff121212),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 25,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: "Search",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80, bottom: 20),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: Text(
                      "All tasks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                for (ToDo todo in todosList)
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                    child: ToDoItem(
                      todo: todo,
                      onToDoChanged: handleToDoChange,
                      onDeleteItem: deleteToDoItem,
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin:  EdgeInsets.only(
                              bottom: 20, right: 20, left: 20),
                          padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0.0),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: todoController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Add a new task",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                        child: ElevatedButton(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          onPressed: () {
                            addToDoItem(todoController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Colors.green,
                            elevation: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todotext: toDo));
    });
    todoController.clear();
  }
}
