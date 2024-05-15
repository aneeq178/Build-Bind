
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/api_calls.dart';
import '../View/show_snackbar.dart';

class UserLocalController extends ChangeNotifier
{
  String name='';
  String phone='';
  String email='';
  String image='';
  bool contractorCheck=false;


   getData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     name =await prefs.getString('name')??'Aneeq';
     phone =await prefs.getString('phone')??'+ 92';
     email =await prefs.getString('email')??'aneeq2@gmail.com';
     image =await prefs.getString('image')??'';
    String is_contractor=await ApiCall.getUserType()??'';

    if(is_contractor=='true')
      {
        contractorCheck=true;
      }
    else
      {
        contractorCheck=false;
      }


    print(image);


    notifyListeners();
  }


  updateUser(String phone,String username,BuildContext context) async {
    Map<String,dynamic> body = {'phone': email, 'username': username};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPut(body, '/update_user/');
      hideLoading();
      if (response != null) {

          showSnackbar(context, "Updated Successfully");
          final SharedPreferences prefs = await SharedPreferences.getInstance();

          await prefs.setString('phone',phone);
          await prefs.setString('name',name);
    }} catch (e) {
      showSnackbar(context, 'An error Occurred, Please try again later');

      print("error in controller  ${e}");
    }
  }

}