
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../Models/contractor_model.dart';




class FavController extends ChangeNotifier {

  List<Map<String, dynamic>> itemMapList = [];
  List<Contractor> templist = [];

  Future<void> saveFav(List<Contractor> cartitem) async {
    print("yes yes yes ........");
    GetStorage storage = GetStorage();
    templist = cartitem;
    cartitem == null ? print("null") : print(cartitem.length);
    ;
    templist.forEach((element) {
      itemMapList.add(element.toJson());
    });
    print(itemMapList);
    print("length of list before entry is: ${itemMapList.length}");
    await storage.write("contractor", itemMapList);
    print("done");
  }

  Future<void> update(List<Contractor> cartitem) async {
    print("updating this shit ${cartitem.length}");


    GetStorage storage = GetStorage();

    itemMapList = await storage.read("contractor");

    templist = cartitem;

    templist.forEach((element) {
      itemMapList.add(element.toJson());
    });

    print(itemMapList);
    print("length of list before entry is: ${itemMapList.length}");
    await storage.write("contractor", itemMapList);
  }


  Future<void> delete() async {
    GetStorage storage = GetStorage();
    itemMapList.clear();
    print(itemMapList);
    print("length of list before entry is: ${itemMapList.length}");

    templist.clear();
    notifyListeners();
    await storage.write("contractor", itemMapList);
  }


  Future<List<Contractor>>? getFav() async {
    print("get cart");
    GetStorage storage = GetStorage();
    List<dynamic> itemMapList = [];
    itemMapList.clear();
    try {
      itemMapList = await storage.read("contractor");
    } catch (e) {
      print(e);
    }

    print("length of list after etrval ${itemMapList.length} ");
    print("length of list after etrval1212 ${itemMapList} ");

    List<Contractor> cartList = [];
    itemMapList.forEach((element) {
      print(element['quantity']);
      cartList.add(Contractor.fromJson(element));
    });

    templist=cartList;
    notifyListeners();

    // cartList.forEach((element) { print("qtyyyy ${}");});
    return cartList;
  }
}







