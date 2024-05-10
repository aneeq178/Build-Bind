import 'dart:convert';

import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:buildbind/View/bottom_nav_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/api_calls.dart';
import '../View/Auth/representative_regitration.dart';
import '../View/show_snackbar.dart';

class AuthController
{
  
 

/////////////////////// Log In

  login(String email,String password,BuildContext context) async {
    Map<String,dynamic> body = {'email': email, 'password': password};

    // try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/login');
      hideLoading();
      if (response != null) {
        if(response=='false')
          {
            showSnackbar(context, 'Invalid Credentials');
            return;
          }
        else{

          print(response['user']);
          // print(response['user']['user_id'].toString());

          String is_contractor='';
          for(var data in response['user'])
            {
              print('in it data');

              String id = data['user_id'].toString();
              String name = data['username'].toString();
             var email = data['email'].toString();
              String phone = data['phone'].toString();
               is_contractor = data['is_contractor'].toString();
              String cnic  = data['cnic'].toString();

              print(is_contractor);
              // String image  = response['user']['image'].toString();

              final SharedPreferences prefs = await SharedPreferences.getInstance();


              await prefs.setString('id',id);
              await prefs.setString('phone',phone);
              await prefs.setString('name',name);
              await prefs.setString('email',email);
              await prefs.setString('cnic',cnic);
              await prefs.setString('contractor',is_contractor);


            }

          String token  = response['token'].toString();



          showSnackbar(context, 'Logged In Successfully');
          final SharedPreferences prefs = await SharedPreferences.getInstance();


          await prefs.setString('token',token);


          String token2 =await prefs.getString('token')??'';

          print("token is is ${token}");
          print("token is is ${token2}");

          showSnackbar(context, "Login Successful");

          print(is_contractor);

          if(is_contractor=='true')
            {
              context.navigateTo(BottomNavigation2());
            }
          else{
            context.navigateTo(BottomNavigation());
          }

        }

      } else {
        showSnackbar(context, 'An error occurred, Please try again later');
      }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }

  ////////////////////////////////// Log out


  logOut(BuildContext context) async {
    

    try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost({},'/logout');
      hideLoading();
      if (response != null) {
        if(response=='false')


          showSnackbar(context, "Logout Successful");
          context.navigateTo(LoginScreen());
          
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }




  ////////////////////////////////// Sign up

  Signup(String fname,String email,String phone,String is_contractor,
      String cnic,String password,String cincf_path,String cnicb_path,BuildContext context,bool from) async {

    try {

      // final url = Uri.parse('https://buildbind.onrender.com/createuser/');
      final url = Uri.parse('https://buildbind.onrender.com/createuser/');

      final req = http.MultipartRequest('POST', url)
        ..fields['username'] = 'Anewerq'
        ..fields['email'] = 'ane4331@gmail.com'
        ..fields['phone'] = '03437434202'
        ..fields['is_contractor'] = 'false'
        ..fields['cnic'] = '37301-3481334-2'
        ..fields['password'] = 'pass123341'
        ..files.add(await http.MultipartFile.fromPath(
            'cnic_front',cincf_path))
        ..files.add(await http.MultipartFile.fromPath(
            'cnic_back', cnicb_path));

      print(cnicb_path);
      print(cincf_path);


      var hideLoading = showLoading(context, 'Please Wait..');

      final stream = await req.send();

      final res = await http.Response.fromStream(stream);

      hideLoading();
      // var response =res.body;
      print(res.statusCode);
      print(res.body);

      if (res.statusCode==200) {

        showSnackbar(context, "Registered Successfully");
        from?context.navigateTo(RepresentativeRegistration(type: 'A')):context.navigateTo(LoginScreen());

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }



  //////////////////////////////////////// Forgot Password


  forgotPassword(String email,String password,BuildContext context) async {
    Map<String,dynamic> body = {'email': email, 'password': password};

    try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/login');
      hideLoading();
      if (response != null) {


      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  /////////////////////////////////////

}