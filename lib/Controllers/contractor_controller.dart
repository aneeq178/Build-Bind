import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Services/api_calls.dart';
import '../View/show_snackbar.dart';

class ContractorController
{

  //////////////// Register Contractor

  RegisterContractor(String type,String emp_num,String? compnayname,String email,
  String? ntn,String r_name,String r_pos,String description,String pec_license,String r_fcnic,String r_bcnicn,BuildContext context) async {


    try {
      final url = Uri.parse('http://localhost:5000/contractors/');

      final req = http.MultipartRequest('POST', url)
        ..fields['contractor_type'] = 'individual'
        ..fields['no_of_employees'] = '10'
        ..fields['user_id'] = '123'
        ..fields['company_name'] = compnayname??''
        ..fields['email'] = email
        ..fields['company_ntn'] = ntn??''
        ..fields['individual_name'] = r_name
        ..fields['individual_position'] = r_pos
        ..fields['description'] = description
        ..files.add(await http.MultipartFile.fromPath(
            'company_pec_license', pec_license))
        ..files.add(await http.MultipartFile.fromPath(
            'r_fcnic',r_bcnicn))
        ..files.add(await http.MultipartFile.fromPath(
            'r_bcnic', r_fcnic));

      final stream = await req.send();
      final res = await http.Response.fromStream(stream);

      if (res.statusCode==200) {

        showSnackbar(context, "Registered Successfully");

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  //////////////////// Edit Contractor

  EditContractor(String email,String password,BuildContext context) async {
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




  ////////////// Get contactors
  getContractors(String email,String password,BuildContext context) async {
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
}