import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalController extends ChangeNotifier
{
  String city='';

  void saveCity(String city) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', city);
  }

  void getCity(String city) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String city = prefs.getString('city')??'';
  }

}