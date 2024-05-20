import 'dart:convert';

import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:buildbind/View/bottom_nav_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/api_calls.dart';
import '../Utills/utills.dart';
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
          var data = response['user'];

              print('in it data');

              String id = data['user_id'].toString();
              String name = data['username'].toString();
             var email = data['email'].toString();
              String phone = data['phone'].toString();
               is_contractor = data['is_contractor'].toString();
              String cnic  = data['cnic'].toString();

              print(is_contractor);
              String image  = response['user']['user_img'].toString();

              final SharedPreferences prefs = await SharedPreferences.getInstance();

              print('imageis ${image}');

              await prefs.setString('id',id);
              await prefs.setString('phone',phone);
              await prefs.setString('name',name);
              await prefs.setString('email',email);
              await prefs.setString('cnic',cnic);
              await prefs.setString('image',image);
              await prefs.setString('contractor',is_contractor);




          String token  = response['token'].toString();

          showSnackbar(context, 'Logged In Successfully');

          await prefs.setString('token',token);


          String token2 =await prefs.getString('token')??'';

          print("token is is ${token}");
          print("token is is ${token2}");

          showSnackbar(context, "Login Successful");

          print(is_contractor);

          if(is_contractor=='true')
            {

              String c_name = response['contractorDetails']['company_name'].toString();
              String c_ntn = response['contractorDetails']['company_ntn'].toString();
              String c_mail = response['contractorDetails']['company_email'].toString();

              await prefs.setString('c_name',c_name);
              await prefs.setString('c_ntn',c_ntn);
              await prefs.setString('c_mail',c_mail);


              await prefs.setString('is_contractor','true');
              context.navigateTo(BottomNavigation2());
            }
          else{
            await prefs.setString('is_contractor','false');
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
      String cnic,String password,String cincf_path,String cnicb_path,String img,BuildContext context,bool from) async {

    try {

      // final url = Uri.parse('https://buildbind.onrender.com/createuser/');


      var headers={
        'Content-Type': 'multipart/form-data',
      };
      final url = Uri.parse('$BASEURL/createuser/');

      final req = http.MultipartRequest('POST', url)
        ..fields['username'] = fname
        ..fields['email'] = email
        ..fields['phone'] = phone
        ..fields['is_contractor'] = 'false'
        ..fields['cnic'] = cnic
        ..fields['password'] = password
        ..files.add(await http.MultipartFile.fromPath(
            'user_img',img))
        ..files.add(await http.MultipartFile.fromPath(
            'cnic_front',cincf_path))
        ..files.add(await http.MultipartFile.fromPath(
            'cnic_back', cnicb_path));

        req.headers.addAll(headers);

      print(cnicb_path);
      print(cincf_path);


      var hideLoading = showLoading(context, 'Please Wait..');

      final stream = await req.send().timeout(Duration(seconds: 10));

      final res = await http.Response.fromStream(stream);

      hideLoading();
      // var response =res.body;
      print(res.statusCode);
      print(res.body);

      if (res.statusCode==200) {

        showSnackbar(context, "Registered Successfully");
        context.navigateTo(LoginScreen());

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      showSnackbar(context, 'An error Occurred, Please try again later');
      print("error in controller  ${e}");
    }
  }



  //////////////////////////////////////// Forgot Password

  forgotPassword(String phone,String password,BuildContext context) async {
    Map<String,dynamic> body = {'phone': '03477664202', 'password': password};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/forgot-password');
      hideLoading();
      if (response != null) {

        showSnackbar(context, 'Password Updated');

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  /////////////////////////////////////

}