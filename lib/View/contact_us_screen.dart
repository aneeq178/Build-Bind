import 'package:buildbind/View/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: HeadingText(text:'Contact Us'),
        centerTitle: true, // Center the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      Container(
        height: 40.h,
            child: Image.asset('assets/images/contactus.jpg')),
        SizedBox(
          height: 10,
        ),
        HeadingText2(text:"For queries, Please contact us",
        ),



               SimpleText(text: 'Contact Us: 03475907436'),
        SizedBox(
          height: 10,
        ),

        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(

                child: Icon(Icons.facebook, color: Colors.blue)),
            SizedBox(
              width: 10,
            ),
            GestureDetector(

                child: Image.asset('assets/images/insta.png',width: 5.w,)),
            SizedBox(
              width: 10,
            ),
            GestureDetector(

                child: Image.asset('assets/images/snap.png',width: 5.w)),

            SizedBox(
              width: 10,
            ),
            GestureDetector(

                child: Image.asset('assets/images/tiktok.png',width: 5.w)),

            SizedBox(
              width: 10,
            ),



            SizedBox(
              width: 10,
            ),
            GestureDetector(

                child: Image.asset('assets/images/youtube.png',width: 5.w,)),
          ],
        ),
          ],
        ),
      ),
    );
  }
}
