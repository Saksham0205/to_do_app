class ToDo{
  String? id;
  String? todotext;
  bool isDone;

  ToDo({
    required this.id,
    required this.todotext,
    this.isDone =false,

});
static List<ToDo> TodoList(){
  return[
    ToDo(id: "1", todotext: "Linkedin", isDone: true),
    ToDo(id: "2", todotext: "Check Mail", isDone: true),
    ToDo(id: "3", todotext: "Team meet at 3 p.m" ),
    ToDo(id: "4", todotext: "Internship work" ),
    ToDo(id: "5", todotext: "Groceries "),
  ];
}

}