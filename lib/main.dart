import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screens/home_screen.dart';

void main(List<String> args) async{
  //init Hive
  await Hive.initFlutter();

  //init box
  var box = await Hive.openBox('myBox');
  runApp(const TODO());  
}
class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}