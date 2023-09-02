import 'package:hive_flutter/adapters.dart';

class ToDoDb{
  List list_todo = [];

  final _mybox = Hive.box('myBox');

  void loadData(){
    list_todo = _mybox.get('TODOLIST');
  }


  void updateData(){
   _mybox.put('TODOLIST', list_todo);
  }

}