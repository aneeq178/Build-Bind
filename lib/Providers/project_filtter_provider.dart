import 'package:flutter/cupertino.dart';



class PFilterProvider extends ChangeNotifier
{
  int fillter_p_cost=0;
  int fillter_p_categroy=0;
  int fillter_p_type=0;
  int fillter_p_mode=0;


  updatecost(int f){
    fillter_p_cost=f;
    notifyListeners();
  }

  resetFilters(){
     fillter_p_cost=0;
     fillter_p_categroy=0;
     fillter_p_type=0;
     fillter_p_mode=0;
    notifyListeners();
  }

  updatecategory(int f){
    fillter_p_categroy=f;
    notifyListeners();

  }

  updatetype(int f){
    fillter_p_type=f;
    notifyListeners();

  }

  updatemode(int f){
    fillter_p_mode=f;
    notifyListeners();

  }


}