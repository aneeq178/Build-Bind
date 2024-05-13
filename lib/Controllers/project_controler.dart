import 'dart:developer';

import 'package:buildbind/Models/project_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Services/api_calls.dart';
import '../Utills/utills.dart';
import '../View/show_snackbar.dart';

class ProjectController extends ChangeNotifier
{
  List<Project> projects=[];


  getProjects(BuildContext context) async {

    // try {

    var response = await ApiCall.callApiGet('/project_media');

    if(response !=null)
    {
     projects.clear();
      for (var data in response['Projects'])
      {
        projects.add(Project.fromJson(data));
      }
      print('Length of project is${projects.length}');


      notifyListeners();
    }

    else
    {
      showSnackbar(context, "An error occurred please try again");
    }

    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }






  createNewProject(String p_name,String p_details,String qa,String p_category,String p_type,String p_mode,String p_listing,
  String p_floors,String p_area,String p_living_area,String p_washorrom,String p_kitchen,String p_lat,String p_long,String p_budget
      ,String img_1,String img_2,String img_3,String model,BuildContext context) async {


    try {
      final url = Uri.parse('$BASEURL/create_project/');

      log(url.toString());
      log(img_1);
      log(model);


      String token =await ApiCall.getToken();

      final req = http.MultipartRequest('POST', url)
        ..fields['project_name'] = 'Dummy Project'
        ..fields['project_details'] = 'This is a dummy project for testing purposes'
        ..fields['p_category'] = 'residential'
        ..fields['p_type'] = 'grey structure'
        ..fields['p_mode'] = 'with material'
        ..fields['p_qa'] = 'true'
        ..fields['p_listing'] = 'house'
        ..fields['p_floors'] = '2'
        ..fields['p_area'] = '2000'
        ..fields['p_living_area'] = '1500'
        ..fields['p_washroom'] = '2'
        ..fields['p_kitchen'] = '1'
        ..fields['p_status'] = 'Listed'
        ..fields['p_latitude'] = '37.7749'
        ..fields['p_longitude'] = '-122.4194'
        ..fields['p_budget'] = '100000'
        ..files.add(await http.MultipartFile.fromPath(
            'image_1', img_1))
        ..files.add(await http.MultipartFile.fromPath(
            'image_2', img_2))
        ..files.add(await http.MultipartFile.fromPath(
            'image_3', img_3))
        ..files.add(await http.MultipartFile.fromPath(
            'model_3d', model));

      var hideLoading = showLoading(context, 'Please Wait..');

      req.headers['authorization'] = token;

      final stream = await req.send();
      final res = await http.Response.fromStream(stream);

      hideLoading();

      print(res.statusCode);
      print(res.body);

  if (res.statusCode==200) {

  showSnackbar(context, "Project Uploaded");

  } else {
  showSnackbar(context, 'An error Occurred, Please try again later');
  }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }



  //////////////// Delete Project

  deleteProject(String email,String password,BuildContext context) async {
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


  ///////////////// Get my projects

  getMyProjects(String email,String password,BuildContext context) async {
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


  ///////////////// Get Level 1 Projects

  getLevel1Projects(String email,String password,BuildContext context) async {
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



  ////////////////// Search Projects

  searchProjects(String parameter,String value,BuildContext context) async {


    try {
      // var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiGet('search-projects/?$parameter=$value');
      // hideLoading();
      if (response != null) {
        projects.clear();
        for (var data in response['projects'])
        {
          projects.add(Project.fromJson(data));
        }
        print('Length of project is${projects.length}');

        notifyListeners();
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }








}