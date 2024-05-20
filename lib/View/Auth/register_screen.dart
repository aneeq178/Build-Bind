import 'dart:io';
import 'dart:math';
import 'package:buildbind/Controllers/auth_controller.dart';
import 'package:buildbind/Providers/Text_Recognition_Provider.dart';
import 'package:buildbind/Utills/extentions/navigation_extension.dart';
import 'package:buildbind/View/Auth/login_screen.dart';
import 'package:buildbind/View/Auth/register_two.dart';
import 'package:buildbind/View/Auth/representative_regitration.dart';
import 'package:buildbind/View/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Models/contractor_model.dart';
import '../../Utills/AppColors.dart';
import '../widgets/sized_boxes.dart';
import '../widgets/texts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    required this.from,
  });

  final bool from;// true for contractor and false for normal user
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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



  var _namecontroller = TextEditingController();
  var _CNICcontroller = TextEditingController();
  var _NTNcontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passwordcontrller = TextEditingController();
  var _phonecontrller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp cnicRegex = RegExp(r'\b\d{5}-\d{7}-\d{1}\b');

  File? _image;
  String? imgpath;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imgpath = pickedFile.path;
      });

    print(_image);
    print(imgpath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(1.w),
            child: GestureDetector(
              onTap: (){
                context.navigateBack();
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
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hsizedbox2,
                  hsizedbox2,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: HeadingText(text: widget.from?'Become a Contractor':'Register')),
                  hsizedbox2,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SimpleText(text:  widget.from?'Provide details of your Company':'Provide Your Details')),
                  hsizedbox2,

                  GestureDetector(
                    onTap: (){
                      pickImage();
                    },
                    child: Container(
                      width: 30.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: APPCOLORS.PRIMARY,
                      ),
                      child: ClipOval(
                        child: _image == null
                            ? Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 50,
                        )
                            : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 30.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2.w),
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
                                return 'Please enter name';
                              }

                              return null;
                            },

                            decoration: InputDecoration(
                              hintText: widget.from?'company name':'name',
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
                    child: Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _emailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter email';
                              }
                              else if(regex.hasMatch(value))
                              {
                                return null;
                              }
                              else{
                                return 'please enter valid email';
                              }
                              // Add additional password validation logic if needed
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'email',
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
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _phonecontrller,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixText: '+92',
                              labelText: 'Phone Number',
                              border:   InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  hsizedbox2,
                  !widget.from?Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.GREY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
                              LengthLimitingTextInputFormatter(15), // Limit to 15 characters (including hyphens)
                            ],
                            controller: _CNICcontroller,
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
                            decoration: InputDecoration(
                              labelText: 'CNIC',
                              hintText: 'XXXXX-XXXXXXX-X',
                              border:   InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.GREY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _NTNcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter NTN';
                              }
                              else
                              {
                                return null;
                              }

                            },
                            decoration: InputDecoration(
                              labelText: 'NTN',

                              border:   InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  hsizedbox1,



                      widget.from?Container():Consumer<TextRecognitionController>(builder: (context, data, child) {
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

                  hsizedbox2,
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: APPCOLORS.GREY,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: _passwordcontrller,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Please enter password';
                              }
                              else if(value.length<5)
                              {
                                return 'password length should be >5';
                              }

                              return null;
                            },

                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  hsizedbox1,
                  Row(
                    children: [
                      Text('Already Registered?'),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                          child: Text('Login',style: TextStyle(color: APPCOLORS.PRIMARY,fontSize:12.sp,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  hsizedbox6,

                  Consumer<TextRecognitionController>(builder: (context, data, child) {
                    return     GestureDetector(
                      onTap: (){

                        if (_formKey.currentState?.validate() ?? false) {


                          if(!widget.from)
                            {
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

                              var ctrl=AuthController();

                              ctrl.Signup(_namecontroller.text, _emailcontroller.text,
                                  '+92${_phonecontrller.text}', 'false',_CNICcontroller.text ,_passwordcontrller.text
                                  ,data.Cnicf!,data.Cnicb!,imgpath!, context, true);

                            }


                          else{
                            print('last else');
                           var ctrl =AuthController();
                            ContractorReg contractor= ContractorReg(contractorImage: imgpath,companyName: _namecontroller.text,
                                ntn: _NTNcontroller.text,individualEmail: _emailcontroller.text);

                           widget.from?context.navigateTo(RepresentativeRegistration(type: 'A',contractorReg: contractor,)):ctrl.Signup(_namecontroller.text,_emailcontroller.text,_phonecontrller.text,'false',_CNICcontroller.text
                               ,_passwordcontrller.text,data.Cnicf!,data.Cnicb!,imgpath!,context,widget.from);
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
                          child:Text(widget.from?'Next':'Submit',style: TextStyle(color: APPCOLORS.WHITE,fontSize:16.sp,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    );
                  },),



                ],
              ),
            ),
          ),
      
        ),
      
      ),
    );
  }
}
