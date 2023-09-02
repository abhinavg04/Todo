

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoList({super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteTask});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Slidable(
        endActionPane: ActionPane(children: [
              SlidableAction(onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 245, 53, 53),)
        ],
        motion: StretchMotion(),),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.green.shade100
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
              
               Text(taskName,
               style: TextStyle(decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none),),
            
            ],
          ),
        ),
      ),
    );
  }
}