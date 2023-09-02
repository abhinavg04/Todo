import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/db/database.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _mybox = Hive.box('myBox');
  ToDoDb db = ToDoDb(); 

  @override
  void initState() {
    // TODO: implement initState
    if(_mybox.get('TODOLIST') != null){
      db.loadData();
    }
    super.initState();
  }
  void onCheckBoxChanged(bool? value,int index){

    setState(() {
      db.list_todo[index][1] = !db.list_todo[index][1];
    });
     db.updateData();

  }
  void saveNewTask(){
    setState(() {
      db.list_todo.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
     db.updateData();
  }
  void creatnewTask(){
    showDialog(context: context, builder: ((context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    }));
  }
  void delTask(int index){
    setState(() {
      db.list_todo.removeAt(index);
    });
     db.updateData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TODO')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: creatnewTask),
      backgroundColor: Colors.green.shade200,
      body: ListView.builder(
        itemCount: db.list_todo.length,
        itemBuilder:(context, index) {
          return TodoList(taskName: db.list_todo[index][0], 
          taskCompleted: db.list_todo[index][1],
           onChanged:(value) => onCheckBoxChanged(value,index),
           deleteTask: (context) => delTask(index)
            );

        },
      ),
      );
  }
}