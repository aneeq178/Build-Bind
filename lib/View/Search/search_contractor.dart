import 'package:buildbind/View/home/dashboard_screen.dart';
import 'package:buildbind/View/widgets/sized_boxes.dart';
import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';

class SearchContractor extends StatefulWidget {
  const SearchContractor({super.key});

  @override
  State<SearchContractor> createState() => _SearchContractorState();
}

class _SearchContractorState extends State<SearchContractor> {
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
        title:Center(child: LabelText(text: 'Search result')),
        actions: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(

                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 90.h,
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
                              LabelText(text: 'Filter'),

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
                          LabelText(text: 'Company Level'),

                          hsizedbox1,

                          Container(
                            height:6.1.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('All',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),
                                wsizedbox2,
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('New Company',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),
                                wsizedbox2,
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('Level 1',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('Level 2',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          LabelText(text: 'Property Area'),

                          hsizedbox1,

                          Container(
                            height:6.1.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('All',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),
                                wsizedbox2,
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('200 sqft',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),
                                wsizedbox2,
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('500 sqft',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(1.w),
                                  height: 6.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: APPCOLORS.GREY, // Set your desired background color
                                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                                  ),
                                  child: Center(
                                    child:  Text('600 sqft',style: TextStyle(color: APPCOLORS.BLACK,fontSize:11.sp,fontWeight: FontWeight.normal),),
                                  ),
                                ),

                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  );
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

              hsizedbox2,
              LabelText(text: 'Found 4 Companies'),
              hsizedbox2,

              FeaturedCompnyTile2(url: 'assets/images/image 27.png', name: 'A&B Builders', rating: '4.4', locaion: 'Rawalpindi'),
              FeaturedCompnyTile2(url: 'assets/images/image 28.png', name: 'Hassan Abdullah Builders', rating: '4.4', locaion: 'Rawalpindi'),
              FeaturedCompnyTile2(url: 'assets/images/image 29              .png', name: 'Bin Aziz Builders', rating: '4.4', locaion: 'Rawalpindi'),
              FeaturedCompnyTile2(url: 'assets/images/image 27.png', name: 'Mahar and Brothers Builders', rating: '4.4', locaion: 'Islamabad'),

            ],
          ),
        ),
      ),
    );
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