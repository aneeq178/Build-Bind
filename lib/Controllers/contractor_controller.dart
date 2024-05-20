import 'dart:convert';
import 'dart:developer';

import 'package:buildbind/Controllers/project_controler.dart';
import 'package:buildbind/Models/contractor_dashboard_model.dart';
import 'package:buildbind/Models/contractor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../Models/project_model.dart';
import '../Services/api_calls.dart';
import '../Utills/AppColors.dart';
import '../Utills/utills.dart';
import '../View/bottom_nav_bar.dart';
import '../View/bottom_nav_two.dart';
import '../View/show_snackbar.dart';
import '../View/widgets/texts.dart';

class ContractorController extends ChangeNotifier {

  List<Contractor> Companies = [];
  List<IndividualContractor> top_contractors = [];

  List<IndividualContractor> all_contractors = [];
  List<Contractor> all_Companies = [];

  List<Project> ongoinProjects = [];

  List<DataModel> contractor_data=[];


  /////////// Get top companies

  getOngoingProjects(BuildContext context) async {
    // try {

    // var hideLoading = showLoading(context, 'Please Wait..');

      print('calling on going');
    String token2=await ApiCall.getToken();

    final headers = {
      'authorization': token2,
    };

    final url = Uri.parse(
        '$BASEURL/contractors_ongoing_projects');

    final res = await http.get(url, headers: headers);
    final status = res.statusCode;

    // hideLoading();
    var response = jsonDecode(res.body);

    print(res.statusCode);
    print(response);


    if (res.statusCode == 200) {
      ongoinProjects.clear();
      for (var data in response) {
        ongoinProjects.add(Project.fromJson(data));
      }

      print('Length of ongoing is${ongoinProjects.length}');

      notifyListeners();
    } else {


    }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }

  /////////// Get top companies

  getTopCompanies(BuildContext context) async {
    // try {
    // var hideLoading = showLoading(context, 'Please Wait..');
    var response = await ApiCall.callApiGet('/get_top_company');
    // hideLoading();
    if (response != null) {
      Companies.clear();
      for (var data in response) {
        Companies.add(Contractor.fromJson(data));
      }
      print('Length of companies is${Companies.length}');

      notifyListeners();
    } else {
      showSnackbar(context, 'An error Occurred, Please try again later');
    }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }


  /////////// Get all companies

  getAllCompanies(BuildContext context) async {
    // try {
    // var hideLoading = showLoading(context, 'Please Wait..');
    var response = await ApiCall.callApiGet('/get_company/');
    // hideLoading();
    if (response != null) {
      all_Companies.clear();
      for (var data in response) {
        all_Companies.add(Contractor.fromJson(data));
      }
      print('Length of bids is${all_Companies.length}');

      notifyListeners();
    } else {
      showSnackbar(context, 'An error Occurred, Please try again later');
    }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }

  /////////// Get all Contractors

  getAllContractors(BuildContext context) async {
    // try {
    // var hideLoading = showLoading(context, 'Please Wait..');
    var response = await ApiCall.callApiGet('/get_contractors/');
    // hideLoading();
    if (response != null) {
      all_contractors.clear();
      for (var data in response) {
        all_contractors.add(IndividualContractor.fromJson(data));
      }
      print('Length of bids is${all_contractors.length}');

      notifyListeners();
    } else {
      showSnackbar(context, 'An error Occurred, Please try again later');
    }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }

  //////////////////Get top contractors


  getTopContractors(BuildContext context) async {
    // try {
    // var hideLoading = showLoading(context, 'Please Wait..');
    var response = await ApiCall.callApiGet('/get_top_contractors/');
    // hideLoading();
    if (response != null) {
      top_contractors.clear();
      for (var data in response) {
        top_contractors.add(IndividualContractor.fromJson(data));
      }
      print('Length of contrator is${top_contractors.length}');

      notifyListeners();
    } else {
      showSnackbar(context, 'An error Occurred, Please try again later');
    }
    // } catch (e) {
    //   print("error in controller  ${e}");
    // }
  }


  ////////////////// Get Business Sneak-Peak


  getDashboard(BuildContext context) async {
    try {
      // var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiGet('/contractor-dashboard/');
      // hideLoading();
      if (response != null) {
        contractor_data.clear();

          contractor_data.add(DataModel.fromJson(response));

        print('Length of bids is${contractor_data.length}');

        notifyListeners();
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    }

  catch (e) {
  print("error in controller  ${e}");
  }
}






  //////////////// Register Contractor

  RegisterContractor(String type,String emp_num,String? compnayname,String email,
      String? ntn,String r_name,String r_pos,String description,String? pec_license,String r_fcnic,String r_bcnicn,String image,BuildContext context) async {

        String token =await ApiCall.getToken();
        String id =await ApiCall.getIds();
    try {
      final url = Uri.parse('$BASEURL/registercontractor');

          if(type=='individual')
          {
            final url = Uri.parse('$BASEURL/registercontractor');

            var hideLoading = showLoading(context, 'Please Wait..');

            print(url);
            final req = http.MultipartRequest('POST', url)
              ..fields['contractor_type'] = 'individual'
              ..fields['no_of_employees'] = emp_num
              ..fields['user_id'] = id
              ..fields['email'] = email
              ..fields['individual_name'] = r_name
              ..fields['individual_position'] = r_pos
              ..fields['description'] = description
              ..files.add(await http.MultipartFile.fromPath(
                  'r_fcnic', r_fcnic))
              ..files.add(await http.MultipartFile.fromPath(
                  'r_bcnic', r_bcnicn))
              ..files.add(await http.MultipartFile.fromPath(
                  'image', image));

            req.headers['authorization'] = token;

            final stream = await req.send();
            final res = await http.Response.fromStream(stream);
            final status = res.statusCode;

            hideLoading();
            if (res.statusCode==200) {

              var response=jsonDecode(res.body);

              // String id = response['contractor']['user_id'].toString();
              String no_of_employyes = response['no_of_employees'].toString();
              String contracotr_type = response['contractor_type'].toString();
              String name = response['name'].toString();

              final SharedPreferences prefs = await SharedPreferences.getInstance();

              // await prefs.setString('id',id);
              await prefs.setString('c_no_emp',no_of_employyes);
              await prefs.setString('c_individual_name',name);
              await prefs.setString('contractor_type',contracotr_type);

              showSnackbar(context, "Registered Successfully");


              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const HeadingText( text: 'Thank You for providing your details',),
                    content: const Text('Your Application is under review by our team you will receive an email one the verification is done'),
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
                },
              );

            }
            }
          else{

            var hideLoading = showLoading(context, 'Please Wait..');

            final req = http.MultipartRequest('POST', url)
              ..fields['contractor_type'] = 'company'
              ..fields['no_of_employees'] = emp_num
              ..fields['user_id'] = id
              ..fields['company_name'] = compnayname!
              ..fields['email'] = email
              ..fields['company_ntn'] = ntn!
              ..fields['individual_name'] =r_name
              ..fields['individual_position'] = r_pos
              ..fields['description'] = description
              ..files.add(await http.MultipartFile.fromPath(
                  'r_fcnic', r_fcnic))
              ..files.add(await http.MultipartFile.fromPath(
                  'r_bcnic', r_bcnicn))
              ..files.add(await http.MultipartFile.fromPath(
                  'company_pec_license',  pec_license!))
              ..files.add(await http.MultipartFile.fromPath(
                  'image', image));

            req.headers['authorization'] = '$token';
            req.headers['Content-Type']='multipart/form';

            final stream = await req.send();
            final res = await http.Response.fromStream(stream);
            final status = res.statusCode;

            hideLoading();
            print(res.body);
            print(res.statusCode);
                    if (res.statusCode==200) {

                      var response=jsonDecode(res.body);

                      // String id = response['contractor']['user_id'].toString();
                      String no_of_employyes = response['no_of_employees'].toString();
                      String contracotr_type = response['contractor_type'].toString();
                      String name = response['name'].toString();

                      final SharedPreferences prefs = await SharedPreferences.getInstance();

                      // await prefs.setString('id',id);
                      await prefs.setString('c_no_emp',no_of_employyes);
                      await prefs.setString('c_individual_name',name);
                      await prefs.setString('contractor_type',contracotr_type);

                      showSnackbar(context, "Registered Successfully");

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {



                          return AlertDialog(
                            title: const HeadingText( text: 'Thank You for providing your details',),
                            content: const Text('Your Application is under review by our team you will receive an email one the verification is done'),
                            actions: [

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation2()));
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
                        },
                      );

                  }
          }

    } catch (e) {
      print("error in controller  ${e}");
    }
  }



  // //////////////// Register Contractor
  //
  // RegisterContractor(String type,String emp_num,String? compnayname,String email,
  // String? ntn,String r_name,String r_pos,String description,String? pec_license,String r_fcnic,String r_bcnicn,String image,BuildContext context) async {
  //
  //
  //   try {
  //     final url = Uri.parse('http://10.0.2.2:5000/createuser/');
  //
  //     String token =await ApiCall.getToken();
  //     String id =await ApiCall.getIds();
  //
  //     log(r_fcnic);
  //     log(r_bcnicn);
  //     log(image);
  //     var headers={
  //       'Content-Type': 'multipart/form-data',
  //     };
  //
  //     if(type=='individual')
  //       {
  //         log('typre 1');
  //
  //         final req = http.MultipartRequest('POST', url)
  //           ..fields['contractor_type'] = 'individual'
  //           ..fields['no_of_employees'] = emp_num
  //           ..fields['user_id'] = id
  //           ..fields['email'] = email
  //           ..fields['individual_name'] = r_name
  //           ..fields['individual_position'] = r_pos
  //           ..fields['description'] = description
  //           ..files.add(await http.MultipartFile.fromPath(
  //               'r_fcnic',r_fcnic))
  //           ..files.add(await http.MultipartFile.fromPath(
  //               'r_bcnic', r_bcnicn))
  //           ..files.add(await http.MultipartFile.fromPath(
  //               'company_pec_license', r_bcnicn));
  //           // ..files.add(await http.MultipartFile.fromPath(
  //           //     'image', image));
  //
  //         req.headers['authorization']= token;
  //
  //         req.headers.addAll(headers);
  //
  //
  //         final stream = await req.send();
  //         final res = await http.Response.fromStream(stream);
  //
  //         log(res.statusCode.toString());
  //         log(res.body);
  //         if (res.statusCode==200) {
  //
  //           var response=jsonDecode(res.body);
  //
  //           // String id = response['contractor']['user_id'].toString();
  //           String no_of_employyes = response['no_of_employees'].toString();
  //           String contracotr_type = response['contractor_type'].toString();
  //           String name = response['name'].toString();
  //
  //           final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //           // await prefs.setString('id',id);
  //           await prefs.setString('no_emp',no_of_employyes);
  //           await prefs.setString('individual_name',name);
  //           await prefs.setString('contractor_type',contracotr_type);
  //
  //           showSnackbar(context, "Registered Successfully");
  //
  //         } else {
  //           showSnackbar(context, 'An error Occurred, Please try again later');
  //         }
  //
  //       }
  //     else
  //       {
  //         final req = http.MultipartRequest('POST', url)
  //           ..fields['contractor_type'] = 'company'
  //           ..fields['no_of_employees'] = emp_num
  //           ..fields['user_id'] = 68.toString()
  //           ..fields['company_name'] = compnayname!
  //           ..fields['email'] = email
  //           ..fields['company_ntn'] =ntn.toString()
  //           ..fields['individual_name'] = r_name
  //           ..fields['individual_position'] = r_pos
  //           ..fields['description'] =description
  //           ..files.add(await http.MultipartFile.fromPath(
  //               'r_fcnic', r_fcnic))
  //           ..files.add(await http.MultipartFile.fromPath(
  //               'r_bcnic', r_bcnicn))
  //           ..files.add(await http.MultipartFile.fromPath(
  //               'company_pec_license', pec_license!));
  //
  //         req.headers['authorization'] = token;
  //
  //         final stream = await req.send();
  //         final res = await http.Response.fromStream(stream);
  //
  //         log(res.statusCode.toString());
  //         log(res.body);
  //         if (res.statusCode==200) {
  //
  //           var response=jsonDecode(res.body);
  //
  //           // String id = response['contractor']['user_id'].toString();
  //           String no_of_employyes = response['no_of_employees'].toString();
  //           String contracotr_type = response['contractor_type'].toString();
  //           String name = response['name'].toString();
  //
  //           final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //           // await prefs.setString('id',id);
  //           await prefs.setString('no_emp',no_of_employyes);
  //           await prefs.setString('individual_name',name);
  //           await prefs.setString('contractor_type',contracotr_type);
  //
  //           showSnackbar(context, "Registered Successfully");
  //         } else {
  //           showSnackbar(context, 'An error Occurred, Please try again later');
  //         }
  //       }
  //
  //
  //
  //
  //   } catch (e) {
  //     print("error in controller  ${e}");
  //   }
  // }


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

  //////////////////// Buy Tokens Contractor

  BuyToken(String token,BuildContext context) async {
    Map<String,dynamic> body = {'token_amount': token,};

    try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/purchase-tokens/');
      hideLoading();
      if (response != null) {
        showSnackbar(context, 'Payment Successful');

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
  /////////////////////// Search Contractor

  searchContractors(
     String? value,
      String? value2,
      String? value3,
      BuildContext context) async {


    try {

      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiGet('/search-contractors?individualName=$value&no_of_employees=$value2&rating=$value3');
      hideLoading();
      if (response != null) {
        all_Companies.clear();
        for (var data in response) {
          all_Companies.add(Contractor.fromJson(data));
        }
        print('Length of bids is${all_Companies.length}');

        notifyListeners();
      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }

  /////////////////////// Search Commpany

  searchCompany(
      String? value,
      String? value2,
      String? value3,
      BuildContext context) async {

    try {

      // var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiGet('/search-contractors?companyName=$value&no_of_employees=$value2&rating=$value3');
      // hideLoading();
      if (response != null) {
        all_contractors.clear();
        for (var data in response) {
          all_contractors.add(IndividualContractor.fromJson(data));
        }
        print('Length of bids is${all_contractors.length}');

        notifyListeners();

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }

}