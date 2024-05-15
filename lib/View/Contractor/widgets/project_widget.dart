import 'package:buildbind/View/Contractor/Biding/biding.dart';
import 'package:buildbind/View/MyProjects/project_detaills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/project_model.dart';
import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    required this.project,
    super.key,
  });
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 30.h,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w, // Adjust the width as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.w)),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/companies.png',
                  // 'assets/images/companies.png'
                ), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 24.0,
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.pName??'House',
                  style: TextStyle(
                    color:APPCOLORS.PRIMARY,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                hsizedbox1,
                Container(
                  width: 45.w,
                  child:  Text(
                    project.pDetails??'Project Detailers',
                    style: TextStyle(
                      color:APPCOLORS.BLACK,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                hsizedbox1,

                Row(
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text(
                      'G-13 Islamabad',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rs ${project.pBudget}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),

                hsizedbox1,
                Row(

                  children: [
                    GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectDetaills(project: project,)));
                    },
                      child: Container(
                        height: 6.h,
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: APPCOLORS.SECONDARY,
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        ),
                        child: Text('View Details',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                      ),
                    ),
                    wsizedbox1,
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractorBiding(project: project,)));
                      },
                      child: Container(
                        height: 6.h,
                        padding: EdgeInsets.only(top:3.w,bottom: 3.w,right: 5.w,left:5.w),
                        decoration: BoxDecoration(
                          color: APPCOLORS.SECONDARY,
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        ),
                        child: Text('Bid',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}