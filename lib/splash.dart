

import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'main.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.selectAllTasks().then((value){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return AllTasks(value);
      }));
    });
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }

}