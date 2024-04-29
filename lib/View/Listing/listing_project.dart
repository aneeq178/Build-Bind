import 'package:buildbind/Providers/listing_providers.dart';
import 'package:buildbind/View/Listing/listing_project_two.dart';
import 'package:buildbind/View/Listing/widgets/listing_project_widgets.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
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

  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    var ctrl=context.read<ListingController>();
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/dashboard_back.png',),
          ),),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Consumer<ListingController>(
            builder: (context, data, child) {
              return Column(
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
                      GestureDetector(
                          onTap: (){
                            ctrl.chnagePC(1);
                          },
                          child: SelectionContainerWidget(text: 'Residential',isSelected: data.PC==1?true:false)),
                      wsizedbox2,
                      GestureDetector(
                          onTap: (){
                            ctrl.chnagePC(2);
                          },
                          child: SelectionContainerWidget(text: ' Commercial',isSelected: data.PC==2?true:false)),
                    ],
                  ),

                  hsizedbox3,

                  LabelText(text: 'Construction Type'),
                  hsizedbox1,

                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            ctrl.changeCT(1);
                          },
                          child: SelectionContainerWidget(text: 'Grey Structure',isSelected:data.CT==1?true: false,)),
                      wsizedbox2,
                      GestureDetector(
                          onTap:(){
                            ctrl.changeCT(2);
                          },
                          child: SelectionContainerWidget(text: 'Complete',isSelected: data.CT==2?true:false,)),
                    ],
                  ),

                  hsizedbox3,

                  LabelText(text: 'Construction Mode'),

                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            ctrl.changeCM(1);

                          },
                          child: SelectionContainerWidget(text: 'with material',isSelected:data.CM==1?true: false,)),
                      wsizedbox2,
                      GestureDetector(
                          onTap:(){
                            ctrl.changeCM(2);

                          },
              child: SelectionContainerWidget(text: 'without material',isSelected:data.CM==2?true: false,)),
                    ],
                  ),

                  hsizedbox3,
                  Container(
                    padding: EdgeInsets.only(left:2.w,right: 2.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3.w)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            HeadingText(text: 'Quality Assurance'),
                            wsizedbox1,
                            GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(

                                        title: const Text('Quality Assurance'),
                                        content: const Text('Our team will ensure the use of quality mentioned in the quotation. \nPrice for this serivce is only 50,00 Rs'),
                                        actions: [

                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(Icons.info_outline)),
                          ],
                        ),
                        Switch(
                          activeColor: Colors.green,
                          value:isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              isChecked=!isChecked;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  hsizedbox6,
                  GestureDetector(
                    onTap: (){
                      if(data.CT==0||data.PC==0||data.CM==0)
                        {
                          showSnackbar(context, 'All information is required');
                        }
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
              );
            },

          ),
        ),
      ),
    );
  }
}


