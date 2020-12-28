import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/sp_helper.dart';
import 'package:flutter_app/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TabBarApp());
  }
}


class TabBarApp extends StatelessWidget{
  List<Task> tasks;
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text('My Tasks'),
        bottom: TabBar(tabs: [
          Tab(
            text: 'All Tasks'
          ),
          Tab(
            text: 'Completed Tasks'
          ),
          Tab(
            text: 'Uncompleted Tasks'
          )
        ],isScrollable: true,)
      ),
    body: TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        AllTasks(tasks),
        CompletedTasks(),
        UncompletedTasks()
      ],
    ),
    ));
  }

}

class AllTasks extends StatelessWidget {
  List<Task> tasks;
  AllTasks(this.tasks);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<Task>>(
          future: DBHelper.dbHelper.selectAllTasks(),
        builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else {
              List<Task> data = snapshot.data;
              return ListView();
            }
        },
    )
    );

  }
}

class CompletedTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Completed Tasks')
    );
  }

}

class UncompletedTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Uncompleted Tasks')
    );
  }

}
