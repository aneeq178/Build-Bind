import 'package:buildbind/View/Listing/listing_project_two.dart';
import 'package:buildbind/View/Listing/widgets/listing_project_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../Contractor/contractor_details.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ListingProject extends StatefulWidget {
  const ListingProject({super.key});

  @override
  State<ListingProject> createState() => _ListingProjectState();
}

class _ListingProjectState extends State<ListingProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/dashboard_back.png',),
          ),),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
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
                  wsizedbox7,
                  HeadingText(text: 'Add New Project'),

                ],
              ),

              hsizedbox2,

              // hsizedbox1,
              Text("You can also try detailed Cost Estimation \nbefore listing the project",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox5,

            LabelText(text: 'Project Category'),
            hsizedbox1,

            Row(
              children: [
                SelectionContainerWidget(text: 'Residential'),
                wsizedbox2,
                SelectionContainerWidget(text: ' Commercial'),
              ],
            ),

              hsizedbox3,

              LabelText(text: 'Construction Type'),
              hsizedbox1,

              Row(
                children: [
                  SelectionContainerWidget(text: 'Grey Structure'),
                  wsizedbox2,
                  SelectionContainerWidget(text: 'Complete'),
                ],
              ),

              hsizedbox3,

              LabelText(text: 'Construction Mode'),

              Row(
                children: [
                  SelectionContainerWidget(text: 'with material'),
                  wsizedbox2,
                  SelectionContainerWidget(text: 'without material'),
                ],
              ),

              hsizedbox6,



              GestureDetector(
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>ListingProject2()));
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
                    child: Text('Next', style: TextStyle(color: APPCOLORS.WHITE,
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


