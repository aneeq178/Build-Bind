import 'dart:developer';

import 'package:buildbind/Controllers/project_controler.dart';
import 'package:buildbind/Providers/project_filtter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Utills/AppColors.dart';
import '../../widgets/sized_boxes.dart';
import '../../widgets/texts.dart';
import '../contractor_details.dart';
import '../widgets/project_widget.dart';


class ExploreProjects extends StatefulWidget {
  const ExploreProjects({super.key});

  @override
  State<ExploreProjects> createState() => _ExploreProjectsState();
}

class _ExploreProjectsState extends State<ExploreProjects> {


  @override
  void initState() {
    var ctrl= context.read<ProjectController>();
    ctrl.getProjects( context);
    super.initState();
  }

  int fillter_p_cost=0;
  int fillter_p_categroy=0;
  int fillter_p_type=0;
  int fillter_p_mode=0;


  var _searchcontroler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchctrl= context.read<ProjectController>();

    return Scaffold(
      appBar: AppBar(
        leading:    Padding(
          padding:  EdgeInsets.all(2.w),
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
        title:Center(child: LabelText(text: 'Explore Projects')),
        actions: [

          Padding(
            padding:  EdgeInsets.all(2.w),

            child: GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) {
                    var filtterctrl= context.read<PFilterProvider>();

                    return
                      FiltterWidget(filtterctrl: filtterctrl);

                  },
                );
              },
              child: Container(
                width: 6.h,
                height: 6.h,
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.filter_alt,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:  Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller:_searchcontroler,
                        decoration: InputDecoration(
                          hintText: 'Search Projects',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          searchctrl.searchProjects('name', _searchcontroler.text, context);
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
              hsizedbox1,
              Text("Explore Projects",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
              hsizedbox1,

              Consumer<ProjectController>(builder: (context, data, child) {
                log(data.projects.length.toString());
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.projects.length,
                  itemBuilder: (context, index) {
                  return  ProjectWidget(project: data.projects[index],);
                },);
              },),

              // hsizedbox1,
              // ProjectWidget(),
              // hsizedbox1,
              // ProjectWidget(),

            ],
          ),
        ),
      ),
    );
  }
}

class FiltterWidget extends StatelessWidget {
  const FiltterWidget({
    super.key,
    required this.filtterctrl,
  });

  final PFilterProvider filtterctrl;

  @override
  Widget build(BuildContext context) {
    var ctrl= context.read<ProjectController>();
    return Consumer<PFilterProvider>(builder: (context, data, child) {
      return Container(
        height: 80.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: APPCOLORS.WHITE,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.w),
            topRight: Radius.circular(6.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              hsizedbox3,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelText(text: 'Filters'),

                  Container(
                    padding: EdgeInsets.all(2.w),
                    height: 6.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: APPCOLORS.PRIMARY, // Set your desired background color
                      borderRadius: BorderRadius.all(Radius.circular(8.w)),
                    ),
                    child: Center(
                      child:  Text('Reset',style: TextStyle(color: APPCOLORS.WHITE,fontSize:10.sp,fontWeight: FontWeight.normal),),
                    ),
                  ),

                ],
              ),
              hsizedbox4,
              BoldText(text: 'Cost'),

              hsizedbox1,

              GestureDetector(
                onTap: (){
                 filtterctrl.updatecost(1);
                },
                child: Container(
                  height:6.1.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.w),
                        height: 6.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: data.fillter_p_cost==1?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                          borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        ),
                        child: Center(
                          child:  Text('< 10 M',style: TextStyle(color:  data.fillter_p_cost==1?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                        ),
                      ),
                      wsizedbox2,
                      GestureDetector(
                        onTap: (){
                       filtterctrl.updatecost(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.w),
                          height: 6.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color:  data.fillter_p_cost==2?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                            borderRadius: BorderRadius.all(Radius.circular(8.w)),
                          ),
                          child: Center(
                            child:  Text('< 25 M',style: TextStyle(color: data.fillter_p_cost==2?APPCOLORS.WHITE: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ),
                      wsizedbox2,
                      GestureDetector(
                        onTap: (){
                          filtterctrl.updatecost(3);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.w),
                          height: 6.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            color:  data.fillter_p_cost==3?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                            borderRadius: BorderRadius.all(Radius.circular(8.w)),
                          ),
                          child: Center(
                            child:  Text('> 30 M',style: TextStyle(color:  data.fillter_p_cost==3?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              hsizedbox2,
              BoldText(text: 'Category'),

              hsizedbox1,

              GestureDetector(
                onTap: (){
                  filtterctrl.updatecategory(1);
                },
                child: Container(
                  height:6.1.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.w),
                        height: 6.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: data.fillter_p_categroy==1?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                          borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        ),
                        child: Center(
                          child:  Text('Residential',style: TextStyle(color:  data.fillter_p_categroy==1?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                        ),
                      ),
                      wsizedbox2,
                      GestureDetector(
                        onTap: (){
                          filtterctrl.updatecategory(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.w),
                          height: 6.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: data.fillter_p_categroy==2?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color

                            borderRadius: BorderRadius.all(Radius.circular(8.w)),
                          ),
                          child: Center(
                            child:  Text('Commercial',style: TextStyle(color:  data.fillter_p_categroy==2?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              hsizedbox2,

              BoldText(text: 'Construction Type'),

              hsizedbox1,

              Container(
                height:6.1.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: (){
                        filtterctrl.updatetype(1);
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.w),
                        height: 6.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          color: data.fillter_p_type==1?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                          borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        ),
                        child: Center(
                          child:  Text('Grey Structure',style: TextStyle(color:  data.fillter_p_type==1?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                        ),
                      ),
                    ),
                    wsizedbox2,
                    GestureDetector(
                      onTap: (){
                        filtterctrl.updatetype(2);
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.w),
                        height: 6.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          color: data.fillter_p_type==2?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                          borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        ),
                        child: Center(
                          child:  Text('Complete',style: TextStyle(color: data.fillter_p_type==2?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              hsizedbox2,

              const BoldText(text: 'Construction Mode'),

              hsizedbox1,

              GestureDetector(
                onTap: (){
                  filtterctrl.updatemode(1);
                },
                child: Container(
                  height:6.1.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.w),
                        height: 6.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: data.fillter_p_mode==1?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                          borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        ),
                        child: Center(
                          child:  Text('With Material',style: TextStyle(color: data.fillter_p_mode==1?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                        ),
                      ),
                      wsizedbox2,
                      GestureDetector(
                        onTap: (){
                          filtterctrl.updatemode(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.w),
                          height: 6.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: data.fillter_p_mode==2?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                            borderRadius: BorderRadius.all(Radius.circular(8.w)),
                          ),
                          child: Center(
                            child:  Text('Without Material',style: TextStyle(color: data.fillter_p_mode==2?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              hsizedbox3,
              hsizedbox3,
              hsizedbox3,

              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 20.h,
                    height: 6.h,
                    padding: EdgeInsets.only(top:3.w,bottom: 3.w,right: 5.w,left:5.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.SECONDARY,
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                    ),
                    child: Text('Confirm',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    },);
  }
}
