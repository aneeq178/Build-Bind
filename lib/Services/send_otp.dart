import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../View/show_snackbar.dart';


class SendOtp
{
  Future<String?>  sendOtp(String phoneNumber,BuildContext context) async {
    int otp;


    var hideLoading = showLoading(context, 'Please Wait..');

    var random = Random();
    // Generate a random 4-digit OTP
    otp = (random.nextInt(9000) + 1000);
    print(otp);

    final String msg =
        "Hello from Build Bind!\n\nYour OTP for Registration is: $otp\n\nPlease enter this code in the app to confirm your Proceed.\n\nThank You,\nTeam Shazal";
    String apiUrl = 'http://b2bsms.helium.com.pk/SMSPortal/Customer/ProcessSMS.aspx?userid=eride&pwd=eride123&msg=$msg&mobileno=$phoneNumber';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      hideLoading();
      if (response.statusCode == 200) {
        // Handle the response as needed
        print('OTP Sent Successfully  to ${phoneNumber}');
        showSnackbar(context, "OTP sent Succesfully");
        return otp.toString();
      } else {
        // Handle the error
        print('Failed to send OTP. Status code: ${response.statusCode}');
        showSnackbar(context, "Failed to send OTP. Status code");
      }
    } catch (e) {
      // Handle any exceptions
      print('Error sending OTP: $e');
      showSnackbar(context, "Error sending OTP");
    }
  }

}