import 'package:buildbind/Models/project_model.dart';
import 'package:buildbind/Providers/listing_providers.dart';
import 'package:buildbind/View/Listing/widgets/listing_project_widgets.dart';
import 'package:buildbind/View/costEstimation/cost_estiamation.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class ListingProject2 extends StatefulWidget {
  const ListingProject2({
    required this.project,
    super.key});

  final Project project;

  @override
  State<ListingProject2> createState() => _ListingProject2State();
}

class _ListingProject2State extends State<ListingProject2> {

  var _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ctrl=context.read<ListingController>();

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
            child: Consumer<ListingController>(
              builder: (context, value, child) {
                return Column(
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
                        GestureDetector(
                          onTap: (){
                            ctrl.changeLT(1);
                          },
                            child: SelectionContainerWidget(text: 'House',isSelected:value.LT==1?true:false,)),
                        wsizedbox2,
                        GestureDetector(
                            onTap: (){
                              ctrl.changeLT(2);

                            },
                            child: SelectionContainerWidget(text: 'Apartment',isSelected:value.LT==2?true: false,)),
                        wsizedbox2,
                        GestureDetector(
                            onTap: (){
                              ctrl.changeLT(3);
                            },
                            child: SelectionContainerWidget(text: 'Plaza',isSelected:value.LT==3?true: false,)),
                      ],
                    ),
                    LabelText(text: 'Location'),
                    hsizedbox1,
                    Container(
                      padding: EdgeInsets.all(1.w),
                      height:8.h,
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
                            child: TextFormField(
                              controller: _namecontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty ) {
                                  return 'Please enter project Title';
                                }

                                return null;
                              },

                              decoration: const InputDecoration(
                                hintText:'# Marala # Story Project',
                                labelText: 'Project Title',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    hsizedbox2,

                    Image.asset('assets/images/Layout.png'),

                    hsizedbox2,
                    LabelText(text: 'Map / Models'),
                    hsizedbox1,
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        width: 80.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          color: APPCOLORS.PRIMARY,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Map / Models   (pdf)',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                              wsizedbox2,
                              Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                    ),
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
                    // LabelText(text: 'Budget'),
                    // hsizedbox1,
                    //
                    // TextField(
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //   ),
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: APPCOLORS.GREY, // Grey color for the background
                    //     hintText: 'Budget',
                    //     hintStyle: TextStyle(color: Colors.grey),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(6.w), // Adjust the value for rounded corners
                    //       borderSide: BorderSide.none, // Removes the border
                    //     ),
                    //   ),
                    // ),
                    // hsizedbox2,
                    LabelText(text: 'Project Features'),
                    hsizedbox1,

                    value.LT==3?Column(
                      children: [
                        ProjectFeatureWidget(title:'Floors',quantity:value.floors,num: 1,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'Marla',quantity:value.marla,num: 2,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'Shops',quantity:value.shops,num: 6,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'Residential Floors',quantity:value.RF,num: 7,),

                      ],
                    ):Column(
                      children: [
                        ProjectFeatureWidget(title:'Floors',quantity:value.floors,num: 1,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'Marla',quantity:value.marla,num: 2,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'Living rooms',quantity:value.livingroom,num: 3,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'Washrooms',quantity:value.washroom,num: 4,),
                        hsizedbox1,
                        ProjectFeatureWidget(title:'kitchens',quantity:value.kitchens,num: 5,),

                      ],
                    ),




                    // hsizedbox2,
                    // LabelText(text: 'Environment/Facilities'),
                    // hsizedbox1,
                    // Row(
                    //
                    //   children: [
                    //     SelectionContainerWidget(text: 'Basement',isSelected: false,),
                    //     wsizedbox2,
                    //     SelectionContainerWidget(text: 'Loan',isSelected: false,),
                    //     wsizedbox2,
                    //     SelectionContainerWidget(text: 'Swimming Pool',isSelected: false,),
                    //   ],
                    // ),
                    // hsizedbox1,
                    // Row(
                    //   children: [
                    //     SelectionContainerWidget(text: 'Sun Room',isSelected: false,),
                    //   ],
                    // ),


                    hsizedbox6,

                    GestureDetector(
                      onTap: (){
                        if(value.floors==0||value.marla==0||value.livingroom==0||value.kitchens==0||value.washroom==0||value.LT==0)
                          {
                            showSnackbar(context, 'Please fill all information');
                          }
                        else
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CostEstimation()));
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
                          child: Text('Confirm', style: TextStyle(color: APPCOLORS.WHITE,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),





                  ],
                );
              },

            ),
          ),
        ),
      ),

    );
  }
}
