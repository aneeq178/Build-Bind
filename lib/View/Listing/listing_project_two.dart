import 'package:buildbind/View/Listing/widgets/listing_project_widgets.dart';
import 'package:buildbind/View/costEstimation/cost_estiamation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ListingProject2 extends StatefulWidget {
  const ListingProject2({super.key});

  @override
  State<ListingProject2> createState() => _ListingProject2State();
}

class _ListingProject2State extends State<ListingProject2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/dashboard_back.png',),
          ),),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
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


                LabelText(text: 'Listing Type'),
                hsizedbox1,
                Row(
                  children: [
                    SelectionContainerWidget(text: 'House'),
                    wsizedbox2,
                    SelectionContainerWidget(text: 'Apartment'),
                    wsizedbox2,
                    SelectionContainerWidget(text: 'Hotel'),
                  ],
                ),
                LabelText(text: 'Location'),
                hsizedbox1,

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
                hsizedbox1,

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
                hsizedbox2,
                LabelText(text: 'Project Features'),
                hsizedbox1,

                ProjectFeatureWidget(title:'Floors',quantity:2),
                hsizedbox1,
                ProjectFeatureWidget(title:'Area Sqft',quantity:2000),
                hsizedbox1,
                ProjectFeatureWidget(title:'Living rooms',quantity:6),
                hsizedbox1,
                ProjectFeatureWidget(title:'Washrooms',quantity:4),
                hsizedbox1,
                ProjectFeatureWidget(title:'kitchens',quantity:1),


                hsizedbox2,
                LabelText(text: 'Environment/Facilities'),
                hsizedbox1,
                Row(

                  children: [
                    SelectionContainerWidget(text: 'Basement'),
                    wsizedbox2,
                    SelectionContainerWidget(text: 'Loan'),
                    wsizedbox2,
                    SelectionContainerWidget(text: 'Swimming Pool'),
                  ],
                ),
                hsizedbox1,
                Row(
                  children: [
                    SelectionContainerWidget(text: 'Sun Room'),
                  ],
                ),


                hsizedbox6,

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CostEstimation()));
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
                      child: Text('Confirm', style: TextStyle(color: APPCOLORS.WHITE,
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
