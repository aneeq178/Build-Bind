import 'dart:developer';

import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Contractor/widgets/project_widget.dart';
import 'package:buildbind/View/chat/messages_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Controllers/contractor_controller.dart';
import '../../Controllers/project_controler.dart';
import '../../Utills/AppColors.dart';
import '../Bids/bids_screen.dart';
import '../home/dashboard_screen.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';
import 'contractor_details.dart';

class ContractorHomeScreen extends StatefulWidget {
  const ContractorHomeScreen({super.key});

  @override
  State<ContractorHomeScreen> createState() => _ContractorHomeScreenState();
}
class _ContractorHomeScreenState extends State<ContractorHomeScreen> {
  @override
  void initState() {
    var ctrl= context.read<ContractorController>();
    ctrl.getTopCompanies(context);
    ctrl.getTopContractors(context);

    var ctrl2= context.read<ProjectController>();
    ctrl2.getProjects( context);



    // TODO: implement initState
    super.initState();
  }

  final List<String> imageUrls = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
  ];

  final List<String> titles = [
    'Connect with Clients',
    'Build Bind',
    'Lets Bind Together',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/dashboard_back.png',),
          ),),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    SizedBox(width: 18.w,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagesView(from: false,)));
                        },
                        child: Icon(Icons.message,color: APPCOLORS.PRIMARY,)),
                    SizedBox(width: 2.w,),
                  ],
                ),
                HeadingText(text: "Lets get your \n First Client"),
                hsizedbox2,
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 9/16,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: imageUrls.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imageUrl), // Assuming 'imageUrl' is a valid asset path
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4.w)),
                            color: Colors.amber,
                          ),

                        );
                      },
                    );
                  }).toList(),
                ),


                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                //   },
                //   child: Container(
                //             padding: EdgeInsets.all(2.w),
                //             decoration: BoxDecoration(
                //               color: APPCOLORS.GREY,
                //               border: Border.all(color: Colors.transparent),
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //             child: Row(
                //               children: [
                //   Icon(Icons.search),
                //   SizedBox(width: 8.0),
                //   Expanded(
                //     child: TextField(
                //       onTap: (){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                //       },
                //       decoration: InputDecoration(
                //         hintText: 'Search Company or Contractor',
                //         border: InputBorder.none,
                //       ),
                //     ),
                //   ),
                //               ],
                //             ),
                //           ),
                // ),

                hsizedbox2,


                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Top Construction Companies"),
                    // Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox2,


                Consumer<ContractorController>(builder: (context, data, child) {
                  return Container(
                    height: 8.5.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.Companies.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>  TopCompanies(contractor: data.Companies[index],),),
                  );
                },),



                hsizedbox2,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Top Constructors"),
                    // Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox2,


                Consumer<ContractorController>(builder: (context, data, child) {
                  return
                    Container(
                      height: 16.5.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.top_contractors.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: (){
                            context.navigateTo(ContractorDetails(contractor: data.top_contractors[index],));
                          },
                          child: Container(
                            width: 25.w,
                            height: 1.5.h,
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child:Column(
                              children: [
                                Container(
                                  width: 14.w,
                                  height: 7.5.h,
                                  padding: EdgeInsets.all(5.w),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/temp/zkbowner.jpeg',
                                      ), // Replace with your image asset path
                                      fit: BoxFit.cover,
                                    ),
                                    color: APPCOLORS.GREY,
                                    border: Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(8.w),
                                  ),
                                ),
                                hsizedbox1,
                                Text(data.top_contractors[index].individualName,style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 10.sp)),

                              ],
                            ),
                          ),
                        ),),
                    );

                },),

                hsizedbox1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(text: "Featured Projects"),
                    Text("View All",style:TextStyle(color:Colors.blueAccent,fontSize: 8.sp)),
                  ],
                ),
                hsizedbox1,
                Consumer<ProjectController>(builder: (context, data, child) {
                  log(data.projects.length.toString());
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.projects.length,
                    itemBuilder: (context, index) {
                      return  ProjectWidget(project: data.projects[index],);
                    },);
                },),



              ],
            ),
          ),
        ),
      ),
    );
  }
}


