import 'package:buildbind/Providers/contractor_fillter_provider.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Utills/AppColors.dart';
import '../Contractor/contractor_details.dart';


class SearchContractor extends StatefulWidget {
  const SearchContractor({super.key});

  @override
  State<SearchContractor> createState() => _SearchContractorState();
}

class _SearchContractorState extends State<SearchContractor> {

  bool company_selected=true;
  @override
  Widget build(BuildContext context) {
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
        title:Center(child: LabelText(text: 'Search result')),
        actions: [
          Padding(
            padding:  EdgeInsets.all(2.w),

            child: GestureDetector(
              onTap: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return FilterWidget();
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
        child:Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                },
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchContractor()));
                          },
                          decoration: InputDecoration(
                            hintText: 'Search Company or Contractor',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),

              hsizedbox1,
              Container(
                width: 95.w,
                height: 10.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: APPCOLORS.GREY,
                  borderRadius: BorderRadius.circular(8.w),
                ),

                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                          company_selected=true;
                          });},
                        child: Container(
                          width: 40.w,
                          height: 10.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color:company_selected?APPCOLORS.PRIMARY: APPCOLORS.WHITE,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child:   Center(child: Text("Companies",style:TextStyle(color:!company_selected?APPCOLORS.PRIMARY: APPCOLORS.WHITE,
                              fontSize: 12.sp))),

                        ),
                      ),
                      SizedBox(width: 2.w,),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            company_selected=false;

                          });
                        },
                        child: Container(
                          width: 40.w,
                          height: 10.h,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color:!company_selected?APPCOLORS.PRIMARY: APPCOLORS.WHITE,

                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child:  Center(child: Text("Contractors",style:TextStyle(color:company_selected?APPCOLORS.PRIMARY: APPCOLORS.WHITE,
                              fontSize: 12.sp))),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              hsizedbox2,
              LabelText(text: 'Found 4 Companies'),
              hsizedbox2,

              FeaturedCompnyTile2(url: 'assets/images/image 29              .png', name: 'Bin Aziz Builders', rating: '4.4', locaion: 'Rawalpindi'),
              FeaturedCompnyTile2(url: 'assets/images/image 27.png', name: 'A&B Builders', rating: '4.4', locaion: 'Rawalpindi'),
              FeaturedCompnyTile2(url: 'assets/images/image 28.png', name: 'Hassan Abdullah Builders', rating: '4.4', locaion: 'Rawalpindi'),
              FeaturedCompnyTile2(url: 'assets/images/image 27.png', name: 'Mahar and Brothers Builders', rating: '4.4', locaion: 'Islamabad'),

            ],
          ),
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var ctrl= context.read<CFilterProvider>();

    return
      Consumer<CFilterProvider>(builder: (context, data, child) {
        return   Container(
          height: 80.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: APPCOLORS.WHITE, // Set your desired background color
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
                Align(
                  alignment:Alignment.center,
                  child: Container(
                    height: 0.5.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: APPCOLORS.BLACK, // Set your desired background color
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    ),
                  ),
                ),

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
                BoldText(text: 'Company Employees'),

                hsizedbox1,

                GestureDetector(
                  onTap: (){
                    ctrl.updateemp(1);
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
                            color:data.no_of_emp==1?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set your desired background color
                            borderRadius: BorderRadius.all(Radius.circular(8.w)),
                          ),
                          child: Center(
                            child:  Text('< 8',style: TextStyle(color:data.no_of_emp==1?APPCOLORS.WHITE: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                          ),
                        ),
                        wsizedbox2,
                        GestureDetector(
                          onTap: (){
                            ctrl.updateemp(2);
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            height: 6.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color:data.no_of_emp==2?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set y
                              borderRadius: BorderRadius.all(Radius.circular(8.w)),
                            ),
                            child: Center(
                              child:  Text('< 15',style: TextStyle(color:data.no_of_emp==2?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                            ),
                          ),
                        ),
                        wsizedbox2,
                        GestureDetector(
                          onTap: (){
                            ctrl.updateemp(3);
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            height: 6.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color:data.no_of_emp==3?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set y
                              borderRadius: BorderRadius.all(Radius.circular(8.w)),
                            ),
                            child: Center(
                              child:  Text('< 30 ',style: TextStyle(color: data.no_of_emp==3?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const BoldText(text: 'Company Ratting'),
                hsizedbox1,

                GestureDetector(
                  onTap: (){
                    ctrl.updaterating(1);
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
                            color:data.rating==1?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set y
                            borderRadius: BorderRadius.all(Radius.circular(8.w)),
                          ),
                          child: Center(
                            child:  Text('> 3',style: TextStyle(color: data.rating==1?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                          ),
                        ),
                        wsizedbox2,
                        GestureDetector(
                          onTap: (){
                            ctrl.updaterating(2);
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            height: 6.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color:data.rating==2?APPCOLORS.PRIMARY:APPCOLORS.GREY, // Set y
                              borderRadius: BorderRadius.all(Radius.circular(8.w)),
                            ),
                            child: Center(
                              child:  Text('> 4',style: TextStyle(color: data.rating==2?APPCOLORS.WHITE:APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
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

class FeaturedCompnyTile2 extends StatelessWidget {
  const FeaturedCompnyTile2({
    required this.url,
    required this.name,
    required this.rating,
    required this.locaion,
    super.key,
  });

  final String url;
  final String name;
  final String rating;
  final String locaion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: GestureDetector(
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractorDetails()));
        },
        child: Container(
          width: 90.w,
          height: 20.h,
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: APPCOLORS.GREY,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w, // Adjust the width as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.w)),
                  image: DecorationImage(
                    image: AssetImage(
                      url,
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
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 24.0,
                        ),
                      ),
      
                    ],
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 35.w,
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                          color:APPCOLORS.PRIMARY,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    hsizedbox1,
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow,),
                        Text(
                          rating,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                    hsizedbox1,
                    Row(
                      children: [
                        Icon(Icons.location_on_sharp),
                        Text(
                          locaion,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
      
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}