import 'package:buildbind/Models/project_model.dart';
import 'package:buildbind/Providers/cost_estimation_prvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Controllers/project_controler.dart';
import '../../Models/cost_estimation_model.dart';
import '../../Utills/AppColors.dart';
import '../bottom_nav_bar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class CostEstimation extends StatefulWidget {
  const CostEstimation({
    required this.project,
    required this.imagepaths,
     this.filepath,
    super.key});

  final Project project;
  final String? filepath;
  final  List<String> imagepaths;
  @override
  State<CostEstimation> createState() => _CostEstimationState();
}

class _CostEstimationState extends State<CostEstimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(toolbarHeight: 0,),
      body: WillPopScope(
        onWillPop: () async {
          // Show the quit confirmation dialog
          bool? quitConfirmed = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Quit Confirmation'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Are you sure you want to quit?',),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Yes',
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(true); // Close the dialog with 'true'
                    },
                  ),
                  TextButton(
                    child: Text('No',),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(false); // Close the dialog with 'false'
                    },
                  ),
                ],
              );
            },
          );

          // Return true if the user confirmed quitting, otherwise false
          return quitConfirmed ?? false;
        },
        child: SingleChildScrollView(
          child:
          Consumer<CostEstimationModel>(builder: (context, value, child) {
            return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topLeft,
                    image: AssetImage('assets/images/dashboard_back.png',),
                  ),),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    children: [
                      Container(
                        height: 85.h,
                        child: SingleChildScrollView(
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
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                      ),
                                    ),
                                  ),
                                  wsizedbox7,
                                  HeadingText(text: 'Cost Estimation'),

                                ],
                              ),

                              hsizedbox3,
                              Container(
                                padding: EdgeInsets.all(4.w),
                                width: 100.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: APPCOLORS.PRIMARY,
                                  borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                ),
                                child: Center(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  children: [
                                    Text('Total Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                    Text(value.totalCost.toInt().toString(),style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                  ],
                                )),),

                              hsizedbox2,
                              Container(
                                padding: EdgeInsets.all(4.w),
                                width: 100.w,
                                height: 22.h,
                                decoration: BoxDecoration(
                                  color: APPCOLORS.PRIMARY,
                                  borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                ),
                                child: Center(child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                      children: [
                                        Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                        Text(value.greyStructure.toInt().toString(),style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    hsizedbox1,

                                    Divider(),
                                    hsizedbox1,

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                      children: [
                                        Text('Finishing Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                        Text(value.finishingcost.toInt().toString(),style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    hsizedbox1,

                                    Divider(),

                                    hsizedbox1,

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                      children: [
                                        Text('Labour Cost',style: TextStyle(color: APPCOLORS.WHITE,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                        Text(value.loborcost.toInt().toString(),style: TextStyle(color: APPCOLORS.SECONDARY,fontSize:14.sp,fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                )),),

                              hsizedbox2,
                              Consumer<CostEstimationProvider>(
                                  builder: (context, data, child) {
                                    return Column(
                                      children: [
                                        AnimatedContainer(
                                            padding: EdgeInsets.all(4.w),
                                            duration: Duration(milliseconds: 500),// Set the animation duration
                                            curve: Curves.easeInOut, // Set the animation curve
                                            height: data.isFSselected?25.h:9.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: APPCOLORS.GREY,
                                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    HeadingText2(text:'Foundation Structure'),
                                                    GestureDetector(
                                                        onTap: (){
                                                          final ctrl = context.read<CostEstimationProvider>();
                                                          ctrl.changeState(1);
                                                        },
                                                        child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                                  ],
                                                ),
                                                data.isFSselected?Column(
                                                  children: [
                                                    hsizedbox2,

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                      children: [
                                                        Text('Bricks Cement and Sand',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MbrickCementSand.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                                      children: [
                                                        Text('Roof',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.Mroof.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                                      children: [
                                                        Text('Excavation Steel',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MexcavationSteel.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),
                                                  ],
                                                ):Container(),
                                              ],
                                            )
                                        ),
                                        hsizedbox1,
                                        AnimatedContainer(
                                            padding: EdgeInsets.all(4.w),
                                            duration: Duration(milliseconds: 500),// Set the animation duration
                                            curve: Curves.easeInOut, // Set the animation curve
                                            height: data.isPWselected?20.h:9.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: APPCOLORS.GREY,
                                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    HeadingText2(text:'Plumbing Works'),
                                                    GestureDetector(
                                                        onTap: (){
                                                          final ctrl = context.read<CostEstimationProvider>();
                                                          ctrl.changeState(2);
                                                        },
                                                        child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                                  ],
                                                ),
                                                data.isPWselected?Column(
                                                  children: [
                                                    hsizedbox2,

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                      children: [
                                                        Text('Plumbing Material',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MplumbingMaterial.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                                      children: [
                                                        Text('Labor Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MlaborCostPlumbing.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    // Divider(),
                                                    //
                                                    // Row(
                                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                    //
                                                    //   children: [
                                                    //     Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                    //     Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ):Container(),
                                              ],
                                            )
                                        ),
                                        hsizedbox1,
                                        AnimatedContainer(
                                            padding: EdgeInsets.all(4.w),
                                            duration: Duration(milliseconds: 500),// Set the animation duration
                                            curve: Curves.easeInOut, // Set the animation curve
                                            height: data.isEWselected?25.h:9.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: APPCOLORS.GREY,
                                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    HeadingText2(text:'Electrical Works'),
                                                    GestureDetector(
                                                        onTap: (){
                                                          final ctrl = context.read<CostEstimationProvider>();
                                                          ctrl.changeState(3);
                                                        },
                                                        child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                                  ],
                                                ),
                                                data.isEWselected?Column(
                                                  children: [
                                                    hsizedbox2,

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                      children: [
                                                        Text('Electrical Works Material',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MelectricalMaterial.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                      children: [
                                                        Text('Electrical Works Labor',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MlaborCostElectrical.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),
                                                  ],
                                                ):Container(),
                                              ],
                                            )
                                        ),
                                        hsizedbox1,
                                        AnimatedContainer(
                                            padding: EdgeInsets.all(4.w),
                                            duration: Duration(milliseconds: 500),// Set the animation duration
                                            curve: Curves.easeInOut, // Set the animation curve
                                            height: data.isWMTselected?18.h:9.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: APPCOLORS.GREY,
                                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    HeadingText2(text:'Wood, Metal and Tile Works'),
                                                    GestureDetector(
                                                        onTap: (){
                                                          final ctrl = context.read<CostEstimationProvider>();
                                                          ctrl.changeState(4);
                                                        },
                                                        child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                                  ],
                                                ),
                                                data.isWMTselected?Column(
                                                  children: [
                                                    hsizedbox2,

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                      children: [
                                                        Text('Wood, Metal and Tile Works',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text(value.MwoodMetalTile.toInt().toString(),style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),


                                                  ],
                                                ):Container(),
                                              ],
                                            )
                                        ),
                                        hsizedbox1,
                                        AnimatedContainer(
                                            padding: EdgeInsets.all(4.w),
                                            duration: Duration(milliseconds: 500),// Set the animation duration
                                            curve: Curves.easeInOut, // Set the animation curve
                                            height: data.isFFselected?25.h:9.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: APPCOLORS.GREY,
                                              borderRadius: BorderRadius.all(Radius.circular(3.w)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    HeadingText2(text:'Fitting and Fixtures'),
                                                    GestureDetector(
                                                        onTap: (){
                                                          final ctrl = context.read<CostEstimationProvider>();
                                                          ctrl.changeState(4);
                                                        },
                                                        child: Icon(color: APPCOLORS.PRIMARY,size: 10.w,data.isFSselected?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_rounded)),
                                                  ],
                                                ),
                                                data.isFFselected?Column(
                                                  children: [
                                                    hsizedbox2,

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                                      children: [
                                                        Text('Grey Structure Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                                      children: [
                                                        Text('Finishing Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text('38 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                                                      children: [
                                                        Text('Labour Cost',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                        Text('6 Lakh',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:14.sp,)),
                                                      ],
                                                    ),
                                                  ],
                                                ):Container(),
                                              ],
                                            )
                                        ),

                                      ],
                                    );
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const HeadingText( text: 'Thank You for Listing the Project',),

                                content: const Text('your project will become live after approval from our Team'),
                                actions: [

                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
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
                                        child:Text('Continue Browsing',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: GestureDetector(
                          onTap: ()async{
                            var ctrl = ProjectController();
                            await ctrl.createNewProject(widget.project.pName!,widget.project.pName!,widget.project.pQa.toString()
                                , widget.project.pCategory!, widget.project.pType!,widget.project.pMode!,'house',widget.project.pFloors.toString(),
                                widget.project.pArea!, '10', widget.project.pWashroom.toString(), widget.project.pKitchen.toString(), '31.44', '33.44', '100909',
                                widget.imagepaths[0]!, widget.imagepaths[1]!, widget.imagepaths[2]!, widget.filepath??widget.imagepaths[1]!, context);
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
                              child: Text('Submit', style: TextStyle(color: APPCOLORS.WHITE,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

          },),
        ),
      ),

    );
  }
}
