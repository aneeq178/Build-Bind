import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Controllers/contractor_controller.dart';
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
    // TODO: implement initState
    super.initState();
  }
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
                  children: [
                    Container(
                      width: 40.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        borderRadius: BorderRadius.circular(20.w), // Adjust the radius as needed
                      ),

                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 2.w),
                            Icon(Icons.location_on_sharp,color: APPCOLORS.PRIMARY,),
                            SizedBox(width: 2.w),
                            Text("Islamabad Pakistan",style:TextStyle(color:APPCOLORS.PRIMARY,fontSize: 8.sp)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 18.w,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
                        },
                        child: Image.asset("assets/images/Notification.png")),
                    SizedBox(width: 2.w,),
                    Container(
                      width: 15.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: APPCOLORS.GREY,
                        borderRadius: BorderRadius.circular(30.w), // Adjust the radius as needed
                      ),
                    ),

                  ],
                ),

                hsizedbox5,

                HeadingText(text: "Lets get your \n First Client"),

                hsizedbox2,


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


              ],
            ),
          ),
        ),
      ),
    );
  }
}


