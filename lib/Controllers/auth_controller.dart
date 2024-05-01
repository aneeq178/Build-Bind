import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Services/api_calls.dart';
import '../View/show_snackbar.dart';

class AuthController
{

/////////////////////// Log In

  login(String email,String password,BuildContext context) async {
    Map<String,dynamic> body = {'email': email, 'password': password};

    try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/login');
      hideLoading();
      if (response != null) {

        if (response['message'] == 'Invalid email or password') {
          showSnackbar(context, "Invalid email or password");

        } else {

          showSnackbar(context, "Login Successful");

        }
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }

  ////////////////////////////////// Log out


  logOut(String email,String password,BuildContext context) async {
    Map<String,dynamic> body = {'email': email, 'password': password};

    try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/logout');
      hideLoading();
      if (response != null) {


          showSnackbar(context, "Logout Successful");


      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }




  ////////////////////////////////// Sign up

  Signup(String fname,String email,String phone,String is_contractor,
      String cnic,String password,String cincf_path,String cnicb_path,BuildContext context) async {


    try {

      final url = Uri.parse('http://localhost:5000/createuser/');

      final req = http.MultipartRequest('POST', url)
        ..fields['username'] = fname
        ..fields['email'] = email
        ..fields['phone'] = '+92'+phone
        ..fields['is_contractor'] = 'false'
        ..fields['cnic'] = cnic
        ..fields['password'] = password
        ..files.add(await http.MultipartFile.fromPath(
            'cnic_front', cincf_path))
        ..files.add(await http.MultipartFile.fromPath(
            'cnic_back', cnicb_path));

      final stream = await req.send();
      final res = await http.Response.fromStream(stream);

      var response =res.body;

      if (res.statusCode==200) {

        showSnackbar(context, "Registered Successfully");

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
      var response = await ApiCall.callApiPost(body, '/rider/login');
      hideLoading();
      if (response != null) {

        if (response['message'] == 'Invalid email or password') {
          showSnackbar(context, "Invalid email or password");

        } else {

          showSnackbar(context, "Login Successful");

        }
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  /////////////////////////////////////

}