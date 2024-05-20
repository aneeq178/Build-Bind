import 'package:buildbind/View/Contractor/Biding/biding.dart';
import 'package:buildbind/View/MyProjects/project_detaills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/project_model.dart';
import '../../../Utills/AppColors.dart';
import '../../../Utills/utills.dart';
import '../../widgets/sized_boxes.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    required this.project,
    super.key,
  });
  final Project project;

  @override
  Widget build(BuildContext context) {
    print('$BASEURL/${project.image1}');
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
            ),
            child:  Image.network(
             '$BASEURL/${project.image1}',
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Center(
                  child: Image.asset('assets/images/main2.jpg'),
                );
              },
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
                    maxLines: 5,
                    project.pDetails??'Project Details',
                    style: TextStyle(
                      color:APPCOLORS.BLACK,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                hsizedbox1,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectDetaills(project: project,from: 'C',)));
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