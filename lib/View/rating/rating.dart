import 'dart:io';
import 'dart:developer';
import 'package:buildbind/Controllers/bid_controller.dart';
import 'package:buildbind/Models/bid_model.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../Controllers/chat_controller.dart';
import '../../Controllers/rating_controller.dart';
import '../../Services/api_calls.dart';
import '../../Services/chat_service.dart';
import '../../Utills/AppColors.dart';
import '../../Utills/utills.dart';
import '../chat/chat_screen.dart';
import '../show_snackbar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class RatingView extends StatefulWidget {
  const RatingView({
    required this.pId,
    required this.cId,
    super.key});

  final String pId;
  final String cId;

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  double rating=3;

  var _descriptioncontrller = TextEditingController();
  List<File> _images = [];
  List<String> _imagepaths = [];
  final ImagePicker _picker = ImagePicker();


  Future<void> _pickImage() async {
    if (_images.length < 3) {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _images.add(File(pickedFile.path));
          _imagepaths.add(pickedFile.path);
        });
      }
    } else {
      showSnackbar(context, 'You can only add up to 3 images.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 30.h,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/rating.jpg',
                      // 'assets/images/companies.png'
                    ), // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                  color: APPCOLORS.GREY,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),

              hsizedbox2,
              Row(
                children: [
                  const BoldText(text:'Contractor Ratting'),
                  wsizedbox2,
                  // Text(bid.projectName,style:TextStyle(color:Colors.black,fontSize: 8.sp)),
                ],
              ),
              hsizedbox1,
              Row(
                children: [
                  SimpleText(text:'Share your experience with others.'),
                  wsizedbox2,
                  // Text(bid.contractorName,style:TextStyle(color:Colors.black,fontSize: 8.sp)),
                ],
              ),
              hsizedbox4,

          Align(
            alignment: Alignment.center,
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (val) {
                print(rating);
                rating=val;
              },
            ),
          ),


          hsizedbox4,
              Container(
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
                        controller: _descriptioncontrller,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Add Comments',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              hsizedbox2,

              Container(
                height: 25.h,
                width: 80.w,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: _images.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == _images.length) {
                      return GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SimpleText(text: 'Add Image'),
                                Icon(Icons.add, size: 30,color:APPCOLORS.PRIMARY),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Image.file(_images[index], fit: BoxFit.cover);
                    }
                  },
                ),
              ),


              hsizedbox4,
              GestureDetector(
                onTap: (){
                  if(_descriptioncontrller.text.isEmpty)
                    {
                      showSnackbar(context, 'Please add description ');
                    }
                  else if(_imagepaths.length<3)
                    {
                      showSnackbar(context, 'Add at least 3 images');
                    }
                  else{
                    var ctrl= RatingController();
                    ctrl.rateContractor(widget.pId, widget.cId, _imagepaths[0],_imagepaths[1],_imagepaths[2],rating.toString(),_descriptioncontrller.text, context);
                  }
                },
                child: Container(
                  width: 90.w,
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







            ],
          ),
        ),
      ),
    );
  }
}
