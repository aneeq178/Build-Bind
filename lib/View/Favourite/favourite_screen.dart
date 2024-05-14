import 'package:buildbind/Controllers/local_storage_controller.dart';
import 'package:buildbind/Models/contractor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Utills/AppColors.dart';
import '../Contractor/contractor_details.dart';
import '../Search/search_contractor.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {

    var ctrl= context.read<FavController>();// TODO: implement initState

    ctrl.getFav();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LabelText(text: 'Favourite Contractors'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hsizedbox1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Favourite Contractors for you",style:TextStyle(color:Colors.black,fontSize: 8.sp)),
                  GestureDetector(
                      onTap: (){
                        var ctrl= context.read<FavController>();
                        ctrl.delete();
                      },
                      child: Icon(Icons.delete)),
                ],
              ),
              hsizedbox1,

              Consumer<FavController>(builder: (context, value, child) {

                return Container(
                  height: 80.h,
                  width: 100.w,
                  child:
                  ListView.builder(
                    itemCount: value.templist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ContractorDetails()));
                        },
                        child:FeaturedCompnyTile2(url: 'assets/images/image 29              .png', name:value.templist[index].companyName, rating: '4.4', locaion: 'Rawalpindi', contractor: value.templist[index],),

                      );
                  },)

                );

              },),








            ],
          ),
        ),
      ),
    );
  }
}
