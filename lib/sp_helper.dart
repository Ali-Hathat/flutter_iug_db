import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreferences() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  writeSomethingToSp(String name, int age, bool isMale) {
    sharedPreferences.setString('name',name);
    sharedPreferences.setInt('age',age);
    sharedPreferences.setBool('bool',isMale);

  }

  Map getUserData() {
    String name = sharedPreferences.getString('name');
    int age = sharedPreferences.getInt('age');
    bool isMale = sharedPreferences.getBool('isMale');
    return {'name':name,'age':age,'isMale':isMale};
  }
}