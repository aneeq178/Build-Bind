import 'package:flutter/cupertino.dart';

class CostEstimationProvider extends ChangeNotifier
{
  bool isFSselected=false;  // Foundation & Structure
  bool isPWselected=false;  // Plumbing Works
  bool isEWselected=false;  // Electrical Works
  bool isWMTselected=false;  // Wood, Metal and Tile Works
  bool isFFselected=false;  // Fitting and Fixtures

  changeState(int num) //  num will define which container's state is being changed 1=> is FS ....
  {
    if(num==1)
      {
        isFSselected=!isFSselected;
        notifyListeners();
      }
    if(num==2)
    {
      isPWselected=!isPWselected;
      notifyListeners();
    }
    if(num==3)
    {
      isEWselected=!isEWselected;
      notifyListeners();

    }
    if(num==4)
    {
      isWMTselected=!isWMTselected;
      notifyListeners();

    }
    if(num==5)
    {
      isFFselected=!isFFselected;
      notifyListeners();

    }
  }

}