import 'package:buildbind/Utills/AppColors.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/Auth/register_screen.dart';
import 'package:buildbind/View/Contractor/bussines_sneakpeak.dart';
import 'package:buildbind/View/Contractor/ongoing_projects.dart';
import 'package:buildbind/View/Contractor/rattings.dart';
import 'package:buildbind/View/Settings/update_password.dart';
import 'package:buildbind/View/contact_us_screen.dart';

import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Controllers/user_local_conrtoller.dart';
import '../../../Utills/utills.dart';
import '../../bottom_nav_bar.dart';



class ContractorProfileSettings extends StatefulWidget {
  const ContractorProfileSettings({super.key});

  @override
  State<ContractorProfileSettings> createState() => _ContractorProfileSettingsState();
}

class _ContractorProfileSettingsState extends State<ContractorProfileSettings> {



  @override
  Widget build(BuildContext context) {
var ctrl=context.read<UserLocalController>();
ctrl.getCData();

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
                  Consumer<UserLocalController>(builder: (context, value, child) {
                    return      Container(
                      width: 26.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.SECONDARY,
                        borderRadius: BorderRadius.circular(30.w), // Adjust the radius as needed
                      ),
                      child:  ClipOval(
                        child: FadeInImage(
                          placeholder: AssetImage('assets/images/c9.jpg'), // A grey placeholder image
                          image: NetworkImage('$BASEURL/${value.image}'),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey, // Show grey container if the image fails to load
                            );
                          },
                        ),
                      ),
                    );
                  },),

                  wsizedbox4,

                  Consumer<UserLocalController>(builder: (context, value, child) {

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.cname,style: TextStyle(fontSize: 3.5.w,color: APPCOLORS.BLACK),),
                        Text('NTN : ${value.cntn}',style: TextStyle(fontSize: 3.5.w,color: APPCOLORS.BLACK),),
                        Text('email : ${value.cmail}',style: TextStyle(fontSize: 3.5.w,color: APPCOLORS.BLACK),),
                      ],
                    );
                  },)


                ],
              ),
            ),
            hsizedbox6,
            // hsizedbox6,
            //
            //
            // GestureDetector(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePassword()));
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Change Password',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),
            //
            //       Icon(Icons.key),
            //     ],
            //   ),
            // ),
            // Divider(),
            hsizedbox6,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OnGoingProjects()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ongoing Projects',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),

                  Icon(Icons.notes),
                ],
              ),
            ),
            Divider(),
            hsizedbox2,

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Rattings()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ratings',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),
                  Icon(Icons.notes),
                ],
              ),
            ),
            Divider(),

            hsizedbox2,

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BussinessSneakPeak()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Business Sneak Peak',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),

                  Icon(Icons.notes),
                ],
              ),
            ),
            Divider(),
            hsizedbox2,


            GestureDetector(
              onTap: (){
                context.navigateTo(BottomNavigation());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Buyer Mode',style: TextStyle(fontSize: 4.5.w,color: APPCOLORS.BLACK),),

                  Icon(Icons.switch_access_shortcut),
                ],
              ),
            ),
            Divider(),
            hsizedbox2,

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
