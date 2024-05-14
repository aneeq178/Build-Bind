import 'package:buildbind/Controllers/auth_controller.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Auth/register_screen.dart';
import 'package:buildbind/View/Settings/otp_screen.dart';
import 'package:buildbind/View/bottom_nav_bar.dart';
import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
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

  final _formKey = GlobalKey<FormState>();
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/undraw_city_life_gnpr 1.png'),
                hsizedbox5,
                HeadingText(text: 'Lets Sign in'),
                hsizedbox6,
            
                Container(
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty ) {
                              return 'Please enter email';
                            }
                            else if(regex.hasMatch(value))
                              {
                                return null;
                              }
                            else{
                              return 'please enter valid email';
                            }
                            // Add additional password validation logic if needed
                            return null;
                          },
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
            
                hsizedbox2,
                GestureDetector(
            
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
                          child: TextFormField(
                            controller: _passwordcontrller,
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
                GestureDetector(
                  onTap: (){
                    context.navigateTo(OtpScreen());
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                     child: Text('Forgot Password', style: TextStyle(
                          color: APPCOLORS.PRIMARY,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),)),
                ),

                hsizedbox1,
                Row(
                  children: [
                    Text('Dont have an account? '),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RegisterScreen(from: false)));
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
                    if (_formKey.currentState?.validate() ?? false) {

                       var ctrl=AuthController();

                       ctrl.login(_emailcontroller.text, _passwordcontrller.text, context);


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
      ),


    );
  }


}
