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
      appBar: AppBar(
        leading:    Container(
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
        title:Center(child: LabelText(text: 'Add new Project')),
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              hsizedbox5,
              hsizedbox2,

              HeadingText(text: 'Add New Project'),
              hsizedbox2,

              // hsizedbox1,
              Text("You can also try detailed Cost Estimation \nbefore listing the project",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox5,



            LabelText(text: 'Listing Category'),

            Row(
              children: [
                SelectionContainer(text: 'Residential'),
                wsizedbox2,
                SelectionContainer(text: ' Commercial'),
              ],
            ),

              hsizedbox4,
              LabelText(text: 'Listing Type'),
hsizedbox1,
              Row(
                children: [
                  SelectionContainer(text: 'House'),
                  wsizedbox2,
                  SelectionContainer(text: 'Apartment'),
                  wsizedbox2,
                  SelectionContainer(text: 'Hotel'),
                ],
              ),

            hsizedbox2,


            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: APPCOLORS.GREY, // Grey color for the background
                hintText: 'Enter Name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.w), // Adjust the value for rounded corners
                  borderSide: BorderSide.none, // Removes the border
                ),
              ),
            ),

              hsizedbox2,

              Image.asset('assets/images/Layout.png'),

              hsizedbox2,
              LabelText(text: 'Listing Photos'),

              hsizedbox1,
              Container(
                padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h,bottom: 2.h),
                width: 50.w,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child:
                Center(
                  child:Icon(Icons.add),
                ),
              ),

              hsizedbox2,
              LabelText(text: 'Budget'),

              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: APPCOLORS.GREY, // Grey color for the background
                  hintText: 'Budget',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.w), // Adjust the value for rounded corners
                    borderSide: BorderSide.none, // Removes the border
                  ),
                ),
              ),

              hsizedbox6,

              Container(
                height: 8.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.SECONDARY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text('Submit', style: TextStyle(color: APPCOLORS.WHITE,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),),
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}

class SelectionContainer extends StatelessWidget {
  const SelectionContainer({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h,bottom: 2.h),

      decoration: BoxDecoration(
        color: APPCOLORS.GREY,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child:
      Center(child: Text(text,style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),)),
    );
  }
}
