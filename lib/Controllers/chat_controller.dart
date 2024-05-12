import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Services/api_calls.dart';
import '../View/show_snackbar.dart';

class ChatController extends ChangeNotifier
{
  getChats(BuildContext context) async {

    try {
    // var hideLoading = showLoading(context, 'Please Wait..');
    var response = await ApiCall.callApiGet('get-chats//');
    // hideLoading();
    if (response != null) {

      for (var data in response)
      {

      }


      notifyListeners();
    } else {
      showSnackbar(context, 'An error Occurred, Please try again later');
    }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }



  ///////////////////////////////////////////////

  createChat(String contractor_id,String chatid,BuildContext context) async {
    Map<String,dynamic> body = {'contractor_id': contractor_id, 'chat_id': chatid};

    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      var response = await ApiCall.callApiPost(body, '/create-chat');
      hideLoading();
      if (response != null) {

        log('done done');

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }

  ///////////////////////////////////////////////

  deleteChat(String chatid,BuildContext context) async {


    try {
      var hideLoading = showLoading(context, 'Please Wait..');
      final headers = {
        'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2OCwiZW1haWwiOiJhbmVlcUBnbWFpbC5jb20iLCJpYXQiOjE3MTU0Mjk2MDEsImV4cCI6MTcxNTQzMzIwMX0.YgNv0z36BUlzQ9QnAvioHp7DzAU1lvNsyb7h4eNndOg',
        'Content-Type': 'application/json',
      };

      final data = '{\n    "chat_id":$chatid\n}';

      final url = Uri.parse('http://localhost:5000/delete-chat/');

      final res = await http.delete(url, headers: headers, body: data);
      final status = res.statusCode;
      if (status != 200) throw Exception('http.delete error: statusCode= $status');

      var response= jsonDecode(res.body);
      hideLoading();
      if (status==200) {



          showSnackbar(context, " Chat Deleted");

      } else {
        showSnackbar(context, 'An error Occurred, Please try again later');
      }
    } catch (e) {
      print("error in controller  ${e}");
    }
  }


}