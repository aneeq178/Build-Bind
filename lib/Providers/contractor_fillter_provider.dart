import 'package:flutter/cupertino.dart';

class CFilterProvider extends ChangeNotifier{

  int no_of_emp=0;
  int rating=0;

  updateemp(int f){
  no_of_emp=f;

  notifyListeners();
  }

  updaterating(int f){
    rating=f;
    notifyListeners();

  }

}