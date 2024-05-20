import 'package:buildbind/Controllers/project_controler.dart';
import 'package:buildbind/View/MyProjects/project_detaills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {

  @override
  void initState() {
    var ctrl= context.read<ProjectController>();
    ctrl.myProjects(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(4.w),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 6.h,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  wsizedbox8,
                  const HeadingText(text: 'My Projects'),
        
                ],
              ),
        
              hsizedbox2,
        
              Consumer<ProjectController>(builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.my_projects.length,
                  itemBuilder: (context, index) {
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
                            width: 37.w, // Adjust the width as needed
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
                                  // Container(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   decoration: BoxDecoration(
                                  //     shape: BoxShape.circle,
                                  //     color: Colors.white,
                                  //   ),
                                  //   child: Icon(
                                  //     Icons.favorite_border,
                                  //     size: 24.0,
                                  //   ),
                                  // ),
        
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
                                  value.my_projects[index].pName!,
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
                                    value.my_projects[index].pDetails!,
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
                                    // Text(
                                    //   'G-13 Islamabad',
                                    //   style: TextStyle(
                                    //     color: Colors.black,
                                    //     fontSize: 10.sp,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Text(
                                    value.my_projects[index].pBudget!,
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectDetaills(project: value.my_projects[index],from:'A')));
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
        
                                  ],
                                ),
        
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                },);
              },),
            ],
          ),
        ),
      ),

    );
  }
}
