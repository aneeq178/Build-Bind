import 'package:flutter/cupertino.dart';

class ListingController extends ChangeNotifier
{
  int PC=0;   // Project Category
  int CT=0;   // Construction Type
  int CM=0;   // Constrution Mode
  int LT=0;   // Listing Type

  chnagePC(int pc){
    PC=pc;
    notifyListeners();
  }

  changeCT(int ct){
    CT=ct;
    notifyListeners();
  }

  changeCM(int cm){
    CM=cm;
    notifyListeners();
  }

  changeLT(int lt){
    LT=lt;
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////

  int floors=0;
  int marla=0;
  int livingroom=0;
  int washroom=0;
  int kitchens=0;
  int shops=0;
  int RF=0;

  updateFloor(int fl){
    floors=fl;
    notifyListeners();
  }
  updateMarla(int mar){
    marla=mar;
    notifyListeners();
  }
  updateRoom(int room){
    livingroom=room;
    notifyListeners();
  }
  updateWR(int wr){
    washroom=wr;
    notifyListeners();
  }
  updateKitchen(int kitchen){
kitchens=kitchen;
notifyListeners();
  }
  updateShops(int sh){
   shops=sh;
    notifyListeners();
  }
  updateRF(int rf){
    RF=rf;
    notifyListeners();
  }




}