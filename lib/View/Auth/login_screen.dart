import 'package:buildbind/View/Auth/register_screen.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _emailcontroller = TextEditingController();
  var _passwordcontrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/undraw_city_life_gnpr 1.png'),
              hsizedbox5,
              HeadingText(text: 'Lets Sign in'),
              hsizedbox6,
          
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                },
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.mail),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: _emailcontroller,
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                          },
                          decoration: InputDecoration(
                            hintText: 'email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              hsizedbox2,
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                },
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lock),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: _passwordcontrller,
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              hsizedbox1,
              Row(
                children: [
                  Text('Dont have an account? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => RegisterScreen(from: false,)));
                      },
                      child: Text('Register', style: TextStyle(
                          color: APPCOLORS.PRIMARY,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),)),
                ],
              ),
              hsizedbox6,
          
              GestureDetector(
                onTap: () {
                  print(_emailcontroller.text);
                  print(_passwordcontrller.text);

                  if (_emailcontroller.text == '' ||
                      _passwordcontrller.text == '') {
                    showSnackbar(context, 'Please enter email and password');
                    // showSnackBar(context, 'Please enter email & password');
                  }
                  else if (_emailcontroller.text == 'aneeq178@gmail.com' &&
                      _passwordcontrller.text == 'aneeq@2002') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>BottomNavigation()));
                  }
                  else {
                    showSnackbar(context, 'Incorrect Credentials');
          
                  }
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
                    child: Text('Login', style: TextStyle(color: APPCOLORS.WHITE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }


}
