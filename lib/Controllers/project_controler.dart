import 'dart:developer';

import 'package:buildbind/Models/project_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import '../Services/api_calls.dart';
import '../Utills/AppColors.dart';
import '../Utills/utills.dart';
import '../View/bottom_nav_bar.dart';
import '../View/show_snackbar.dart';
import '../View/widgets/texts.dart';

class ProjectController extends ChangeNotifier
{
  List<Project> projects=[];
  List<Project> my_projects=[];


  getProjects(BuildContext context) async {

    try {

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

    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  myProjects(BuildContext context) async {

    try {

    var response = await ApiCall.callApiGet('/user_projects');

    if(response !=null)
    {
      my_projects.clear();
      for (var data in response)
      {
        my_projects.add(Project.fromJson(data));
      }
      print('Length of project is${
          my_projects.length}');

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
        ..fields['project_name'] = p_name
        ..fields['project_details'] = p_details
        ..fields['p_category'] =p_category
        ..fields['p_type'] = p_type
        ..fields['p_mode'] = p_mode
        ..fields['p_qa'] = 'false'
        ..fields['p_listing'] = p_listing
        ..fields['p_floors'] = p_floors
        ..fields['p_area'] = p_area
        ..fields['p_living_area'] = p_living_area
        ..fields['p_washroom'] = p_washorrom
        ..fields['p_kitchen'] = p_kitchen
        ..fields['p_status'] = 'Pending'
        ..fields['p_latitude'] = '37.7749'
        ..fields['p_longitude'] = '-122.4194'
        ..fields['p_budget'] = p_budget
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

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const HeadingText( text: 'Good Luck with the project',),

            content: const Text('Your Project is now live'),
            actions: [

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
                },
                child: Container(
                  height: 8.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.SECONDARY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child:Text('Continue Browsing',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          );
        });


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

  searchProjects(
      String param,String value,
      String? param2,String? value2,
      String? param3,String? value3,
      BuildContext context) async {
    // try {
      var hideLoading = showLoading(context, 'Please Wait..');

      var response = await ApiCall.callApiGet('/search-projects/?$param=$value&$param2=$value2&$param3=$value3');
      hideLoading();
      projects.clear();

      if (response != null) {

        for (var data in response['Projects'])
        {
          projects.add(Project.fromJson(data));
        }
        print('Length of project is${projects.length}');


        notifyListeners();
      } else {
        showSnackbar(context, 'Projects not found');
      }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
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




  ////////////////  Project

  completeProjectC(String pId,BuildContext context) async {
    Map<String,dynamic> body = {'p_id': pId};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/complete_project_contractor');
      hideLoading();
      if (response != null) {


        showSnackbar(context, 'Project Submitted for approval');
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }

////////////////////////////////

  approveProjectC(String pId,BuildContext context) async {
    Map<String,dynamic> body = {'p_id': pId};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/complete_project_user');
      hideLoading();
      if (response != null) {
        showSnackbar(context, 'Project is Completed Congratulations');
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }

  ////////////////

  completeProjectU(String pId,BuildContext context) async {
    Map<String,dynamic> body = {'p_id': pId};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/complete_project_user');
      hideLoading();
      if (response != null) {


        showSnackbar(context, 'Project Marked as Complete');
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


  //////////////////////////


  pendingProjectU(String pId,BuildContext context) async {
    Map<String,dynamic> body = {'p_id': pId};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/pending_project_user');
      hideLoading();
      if (response != null) {


        showSnackbar(context, 'Project Marked as Complete');
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }




}