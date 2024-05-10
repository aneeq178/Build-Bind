import 'package:buildbind/Models/project_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Services/api_calls.dart';
import '../View/show_snackbar.dart';

class ProjectController extends ChangeNotifier
{
  List<Project> projects=[];

  getProjects(BuildContext context) async {

    try {

    var response = await ApiCall.callApiGet('/projects/');

    if(response !=null)
    {
     projects.clear();
      for (var data in response['items'])
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

    } catch (e) {
      print("error in controller  ${e}");
    }
  }






  createNewProject(String p_name,String p_details,String qa,String p_category,String p_type,String p_mode,String p_qa,String p_listing,
  String p_floors,String p_area,String p_living_area,String p_washorrom,String p_kitchen,String p_lat,String p_long,String p_budget
      ,String img_1,String img_2,String img_3,String model,BuildContext context) async {


    try {
      final url = Uri.parse('https://buildbind.onrender.com/create_project/');

      final req = http.MultipartRequest('POST', url)
        ..fields['project_name'] = p_name
        ..fields['project_details'] = p_details
        ..fields['p_category'] = p_details
        ..fields['p_type'] = p_category
        ..fields['p_mode'] = p_mode
        ..fields['p_qa'] = qa
        ..fields['p_listing'] = p_listing
        ..fields['p_floors'] = p_floors
        ..fields['p_area'] = p_area
        ..fields['p_living_area'] = p_living_area
        ..fields['p_washroom'] = p_area
        ..fields['p_kitchen'] = p_kitchen
        ..fields['p_latitude'] = p_lat
        ..fields['p_longitude'] = p_long
        ..fields['p_budget'] = p_budget
        ..files.add(await http.MultipartFile.fromPath(
            'image_1', img_1))
        ..files.add(await http.MultipartFile.fromPath(
            'image_2', img_2))
        ..files.add(await http.MultipartFile.fromPath(
            'image_3', img_3))
        ..files.add(await http.MultipartFile.fromPath(
            'model_3d', model));

      final stream = await req.send();
      final res = await http.Response.fromStream(stream);


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





}