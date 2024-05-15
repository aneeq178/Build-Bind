import 'dart:developer';
import 'dart:io';
import 'package:buildbind/Models/contractor_model.dart';
import 'package:buildbind/View/Auth/register_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import '../../Providers/Text_Recognition_Provider.dart';
import '../../Utills/AppColors.dart';
import '../show_snackbar.dart';
import '../widgets/app_bar.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class RepresentativeRegistration extends StatefulWidget {
   RepresentativeRegistration({this.contractorReg,required this.type,super.key});
  final String type;
  final ContractorReg? contractorReg;

  @override
  State<RepresentativeRegistration> createState() => _RepresentativeRegistrationState();
}

class _RepresentativeRegistrationState extends State<RepresentativeRegistration> {

  final _formKey = GlobalKey<FormState>();

  var _namecontroller = TextEditingController();
  var _CNICcontroller = TextEditingController();
  var _positioncontroller = TextEditingController();

  File? _image;
  String? imgpath;
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imgpath = pickedFile.path;
      });
      log(imgpath!);
    }
  }

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

  final RegExp cnicRegex = RegExp(r'\b\d{5}-\d{7}-\d{1}\b');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(context),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                 widget.type=='A'?Container(): GestureDetector(
                    onTap: (){
                      pickImage();
                    },
                    child: Container(
                      width: 30.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: APPCOLORS.PRIMARY,
                      ),
                      child: _image == null?Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 50,
                      ): Image.file(_image!),
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
                    child:  Row(
                      children: [
                        Icon(Icons.account_box),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _namecontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter name';
                              }
                              return null;
                            },
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
                    child:  Row(
                      children: [
                        Icon(Icons.abc_outlined),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _positioncontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter your position at company';
                              }
                              return null;
                            },
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
                    child:  Row(
                      children: [
                        Icon(Icons.numbers),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter CNIC';
                              }
                              else
                              {  if (!cnicRegex.hasMatch(value)) {
                                return 'CNIC Format is Incorrect';
                              }}

                              return null;
                            },
                            controller: _CNICcontroller,
                            decoration: InputDecoration(
                              labelText: 'CNIC',
                              hintText: 'XXXXX-XXXXXXX-X',
                              border:   InputBorder.none,
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

                        print('tap');


                        if (_formKey.currentState?.validate() ?? false) {

                          String cnic1=data.cnicNumber!;
                          String cnic2=_CNICcontroller.text.trim().toString();
                          print(data.cnicNumber);
                          print(_CNICcontroller.text);

                          if(data.Cnicf==null || data.Cnicb==null)
                          {
                            showSnackbar(context, "Please select CNIC images");

                          }
                          else if(cnic1 != cnic2)
                          {
                            showSnackbar(context, "CNIC don't match with image");
                          }
                          else{
                            if(widget.type=='A')
                              {
                                ContractorReg contractor= ContractorReg(individualName: _namecontroller.text,companyName: widget.contractorReg?.companyName,ntn: widget.contractorReg?.ntn,
                                    contractorImage: widget.contractorReg!.contractorImage,individualEmail: widget.contractorReg!.individualEmail,cnic: _CNICcontroller.text,position: _positioncontroller.text,cnicfpath: data.Cnicf,cnicbpath: data.Cnicb);

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterTwo(type: widget.type,contractor: contractor,)));

                              }
                            else{
                              ContractorReg contractor= ContractorReg(individualName: _namecontroller.text,contractorImage: imgpath,
                                cnic: _CNICcontroller.text,position: _positioncontroller.text,cnicfpath: data.Cnicf,cnicbpath: data.Cnicb);

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterTwo(type: widget.type,contractor: contractor,)));

                            }
                          }
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

      ),
    );
  }

}
