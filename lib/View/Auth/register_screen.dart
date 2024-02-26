import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/Auth/register_two.dart';
import 'package:buildbind/View/Auth/representative_regitration.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    required this.from,
  });

  final bool from; // true for contractor and false for normal user

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hsizedbox5,
                hsizedbox2,
                Align(
                    alignment: Alignment.centerLeft,
                    child: HeadingText(text: widget.from?'Become a Contractor':'Register')),
                hsizedbox2,
                Align(
                    alignment: Alignment.centerLeft,
                    child: SimpleText(text:  widget.from?'Provide details of your Company':'Provide Your Details',)),
                hsizedbox6,
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
                        Icon(Icons.account_box),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
      
                            decoration: InputDecoration(
                              hintText: 'name',
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
                        child: TextField(
      
                          decoration: InputDecoration(
                            hintText:  widget.from?'NTN':'CNIC',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                hsizedbox2,
                Container(
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
      
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                hsizedbox1,
                Row(
                  children: [
                    Text('Already Registered?'),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Text('Login',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold),)),
                  ],
                ),
                hsizedbox6,
      
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RepresentativeRegistration()));
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
                      child:Text('Next',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
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
