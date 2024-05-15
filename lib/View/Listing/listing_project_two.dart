import 'package:buildbind/Controllers/project_controler.dart';
import 'package:buildbind/Models/cost_estimation_model.dart';
import 'package:buildbind/Models/project_model.dart';
import 'package:buildbind/Providers/listing_providers.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Listing/google_map.dart';
import 'package:buildbind/View/Listing/widgets/listing_project_widgets.dart';
import 'package:buildbind/View/costEstimation/cost_estiamation.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
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
  var _detailscontroller = TextEditingController();

  String? filePath;
  String? filename;
  void _pickPDF(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          filePath = result.files.single.path!;
          filename = result.files.single.name;
          print('Picked PDF file path: $filePath');
          print('Picked PDF file path: $filename');
        });
        // Do something with the picked PDF file


        // You can handle the file path as needed, for example, you may want to display it or perform further operations.
      } else {
        // User canceled the file picking
        print('User canceled the file picking');
      }
    } catch (e) {
      print('Error picking PDF: $e');
    }
  }

  final ImagePicker _picker = ImagePicker();

  List<File> _images = [];
  List<String> _imagepaths = [];

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
  final _formKey = GlobalKey<FormState>();


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
                return Form(
                  key:_formKey,
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
                      hsizedbox1,
                      Container(
                        padding: EdgeInsets.all(1.w),
                        height:12.h,
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
                                maxLines: 2,
                                controller: _detailscontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty ) {
                                    return 'Please enter details';
                                  }

                                  return null;
                                },

                                decoration: const InputDecoration(
                                  labelText: 'Details',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      hsizedbox2,

                      LabelText(text: 'Location'),
                      
                      GestureDetector(
                          onTap: (){
                            // context.navigateTo(GoogleMapScreen());
                          },
                          child: Center(child: Image.asset('assets/images/Layout.png'))),

                      hsizedbox2,
                      LabelText(text: 'Map / Models'),
                      hsizedbox1,
                      GestureDetector(
                        onTap: (){
                          _pickPDF(context);
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
                               filePath==null? Text('Map / Models   (pdf)',style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)):
                              Text(filename!,style: TextStyle(color: APPCOLORS.WHITE,fontSize:12.sp,fontWeight: FontWeight.bold)),
                                wsizedbox2,
                                Icon(Icons.drive_folder_upload_outlined,color: Colors.white,),

                              ],
                            ),
                          ),
                        ),
                      ),
                      hsizedbox1,

                      LabelText(text: 'Listing Photos'),
                      hsizedbox1,
                      Container(
                        height: 35.h,
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
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(Radius.circular(4.w)),
                                  ),
                                  child: Icon(Icons.add, size: 30,color:APPCOLORS.PRIMARY),
                                ),
                              );
                            } else {
                              return Image.file(_images[index], fit: BoxFit.cover);
                            }
                          },
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
                        onTap: ()async{
                          var estctrl=context.read<CostEstimationModel>();
                          // ctrl.calculateTotalCost(1,3,3,4,2,2);

                          if(value.floors==0||value.marla==0||value.livingroom==0||value.kitchens==0||value.washroom==0||value.LT==0)
                            {
                              showSnackbar(context, 'Please fill all information');
                            }
                          else
                            {

                              estctrl.calculateIndividualCost(value.floors,value.marla,value.livingroom,value.washroom,value.kitchens,1);


                              var hideLoading2 = showLoading(context, 'Calculating Cost..');

                              Future.delayed(Duration(seconds: 3), () {
                                hideLoading2();
                                var project=Project(
                                  pName: _namecontroller.text,pDetails: _detailscontroller.text,pQa: widget.project.pQa,pCategory: widget.project.pCategory!,
                                  pType: widget.project.pType!,pMode: widget.project.pMode!,pFloors:  value.floors,pArea:  value.marla.toString(),pWashroom: value.washroom,
                                  pKitchen: value.kitchens,
                                );

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CostEstimation(project: project,imagepaths: _imagepaths,filepath:filePath!)));
                              });



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
                  ),
                );
              },

            ),
          ),
        ),
      ),

    );
  }
}
