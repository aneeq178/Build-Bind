import 'dart:io';
import 'package:buildbind/View/Auth/register_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import '../../Providers/Text_Recognition_Provider.dart';
import '../../Utills/AppColors.dart';
import '../widgets/app_bar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class RepresentativeRegistration extends StatefulWidget {
  const RepresentativeRegistration({required this.type,super.key});
  final String type;

  @override
  State<RepresentativeRegistration> createState() => _RepresentativeRegistrationState();
}

class _RepresentativeRegistrationState extends State<RepresentativeRegistration> {
  File? _cnicfront;
  File? _cnicback;

  String? _cnicfrontP;
  String? _cnicblackP;

  final picker = ImagePicker();

  void _chooseImageSourceModal(bool front) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        var trcontrl=context.read<TextRecognitionController>();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  trcontrl.pickImageAndProcess(source: ImageSource.gallery,front: front);

                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a picture'),
                onTap: () {
                  Navigator.pop(context);
                  trcontrl.pickImageAndProcess(source: ImageSource.camera,front: front);

                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future getCNICF() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _cnicfront = File(pickedFile.path);
        _cnicfrontP = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCNICB() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _cnicback = File(pickedFile.path);
        _cnicblackP = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(context),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hsizedbox1,
                Align(
                    alignment: Alignment.centerLeft,
                    child: HeadingText( text: widget.type=='A'?'Information of Company \nRepresentative':'Please Enter your details')),
                hsizedbox2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: SimpleText(text: 'Fill the Information Bellow',)),
                    GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(

                                content: const Text('Provide Your Position in the company along with your name and CNIC.\n \n'
                                    'It helps us to ensure clean and transparent dealing'),
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
                hsizedbox2,
                GestureDetector(
                  onTap: (){
                    // _pickImage();
                  },
                  child: Container(
                    width: 30.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: APPCOLORS.PRIMARY,
                    ),
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                hsizedbox1,
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.account_box),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               hsizedbox2,
               Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.abc_outlined),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your Position at the company',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                hsizedbox2,

                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: APPCOLORS.GREY,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.numbers),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your CNIC',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                hsizedbox1,
                Consumer<TextRecognitionController>(builder: (context, data, child) {
                  return  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Column(children: [
                      GestureDetector(
                        onTap:(){
                          _chooseImageSourceModal(true);
                        },
                        child: data.Cnicf==null?Image.asset(
                          "assets/images/cnic_front.png",
                          width: 100,
                          height: 100,
                        ):Image.file(
                          data.CnicfileF!,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("CNIC Front"),
                    ]),
                    Column(children: [
                      GestureDetector(
                          onTap: (){
                            _chooseImageSourceModal(false);
                          },
                          child: data.Cnicb==null?Image.asset(
                            "assets/images/cnic_front.png",
                            width: 100,
                            height: 100,
                          ):Image.file(
                            data.CnicfileB!,
                            width: 100,
                            height: 100,
                          )
                      ),
                      SizedBox(height: 10),
                      Text("CNIC Back"),
                    ]),
                  ]);
                },),


                // hsizedbox2,
                // Container(
                //   padding: EdgeInsets.all(2.w),
                //   decoration: BoxDecoration(
                //     color: APPCOLORS.GREY,
                //     border: Border.all(color: Colors.transparent),
                //     borderRadius: BorderRadius.circular(8.0),
                //   ),
                //   child: TextField(
                //     maxLines: 2,
                //     decoration: InputDecoration(
                //       hintText: 'Description of your Company',
                //       border: InputBorder.none,
                //     ),
                //   ),
                // ),
                hsizedbox2,


    Consumer<TextRecognitionController>(builder: (context, data, child) {
    return
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterTwo(type: widget.type,)));
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
            child:Text('Next',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
          ),
        ),
      );
    }),


              ],
            ),
          ),

        ),

      ),
    );
  }
  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          // _selectedImage = File(pickedFile.path);
        });
      } else {
        print('User canceled image picking');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
