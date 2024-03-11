import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/View/Auth/contractor_type.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/Auth/register_screen.dart';
import 'package:buildbind/View/Settings/update_password.dart';

import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../MyProjects/my_projects.dart';
import '../contact_us_screen.dart';

class ProfileSetings extends StatefulWidget {
  const ProfileSetings({super.key});

  @override
  State<ProfileSetings> createState() => _ProfileSetingsState();
}

class _ProfileSetingsState extends State<ProfileSetings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hsizedbox6,
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: 26.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: APPCOLORS.SECONDARY,
                      borderRadius: BorderRadius.circular(30.w), // Adjust the radius as needed
                    ),
                  ),
                  wsizedbox4,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ali',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),
                      Text('+92 3475907436',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),
                    ],
                  ),

                ],
              ),
            ),
            hsizedbox6,
            hsizedbox6,


            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePassword()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change Password',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),

                  Icon(Icons.key),
                ],
              ),
            ),
            Divider(),
            hsizedbox2,
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Contact Support',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),

                  Icon(Icons.call),
                ],
              ),
            ),
            Divider(),
            hsizedbox2,

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProjects()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('My Projects',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),

                  Icon(Icons.notes),
                ],
              ),
            ),
            Divider(),


            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractorType()));
              },
              child: Container(
                padding: EdgeInsets.all(2.w),
                height: 5.5.h,
                decoration: BoxDecoration(
                    color: APPCOLORS.SECONDARY,
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Become a Contractor',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),
              
                    Icon(Icons.account_box_outlined),
                  ],
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(2.w),
                height: 5.5.h,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logout',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ),
            Divider(),


          ],
        ),
      ),
    );
  }
}
