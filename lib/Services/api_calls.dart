import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiCall{

  static Future<String> getToken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =await prefs.getString('token')??'7';
    print("token ${token}");

    return token;
  }

  static Future callApiPost(Map<String, dynamic> body, String endpoint) async {
    try {

      String token =await getToken();


      var headers={
        'Authorization':'Bearer $token',
      };
      String baseUrl = "https://shazal-web.onrender.com$endpoint";
      print(baseUrl);
      print(body);
      print("1");

      // var data= jsonEncode(body);

      print(body);

      final response = await http.post(
        headers: headers,
        Uri.parse(baseUrl),
        body:body,
      ).timeout(Duration(seconds: 10));

      print("2");
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      print("response from api ${jsonResponse}");
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print("main catch ${e}");
      return null;
    }
  }

  /////////////////////////////////////////////////////

  static Future callApiPut(Map<String, dynamic> body, String endpoint) async {
    try {
      String baseUrl = "https://shazal-web.onrender.com$endpoint";
      print(baseUrl);
      print(body);
      print("1");

      // var data= jsonEncode(body);

      print(body);

      final response = await http.put(
        Uri.parse(baseUrl),
        body:body,
      ).timeout(Duration(seconds: 10));

      print("2");
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      print("response from api ${jsonResponse}");
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print("main catch ${e}");
      return null;
    }
  }


  ///////////////////////////////////////////////////

  static Future callApiGet( String endpoint) async {

    print("12");
    try {
      String baseUrl = "https://shazal-web.onrender.com$endpoint";
      print(baseUrl);

      print("1");
      final response = await http.get(
        Uri.parse(baseUrl),
      ).timeout(Duration(seconds: 10));;

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse);
      print(response.statusCode);
      print(response.body);


      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 400) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print("main catch ${e}");
      return e;
    }
  }
}
