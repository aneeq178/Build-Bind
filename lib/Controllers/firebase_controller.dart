// import 'dart:convert';
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'dart:developer' as devtools show log;
//
//
// class FrebaseController
// {
//   Future<bool> sendPushMessage({
//     required String recipientToken,
//     required String title,
//     required String body,
//   }) async {
//    var d= {
//      "type": "service_account",
//      "project_id": "faisal-burger",
//      "private_key_id": "a9575555468554745bfc10f12a3953e2a9b6b583",
//      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDbs/QXJo4+gc2R\nR1SpWEswdWfYcJttMOAeu9QTY9ay4j5iyPSESLmiyDJu0WzqOYFma8m/IFSBSt8S\nXnwP7PumwHg6B1lsi/4U602yaCuf7c2E4n/iFR2/l0LGwGcHU8ct0p+tECVyaK+0\n5/BnAKOYFpbjQ6reZFF4qq+cQIqY+Uq2wq77WXMEXML/nzT2fhBTENHmBsNlYaJC\nsWlS7SkN/hFBDTzZ+SHL9HpwU3zJl8ZfJqgmhq6MxeTa0rXIAvzIJvXyO2VQon+6\n+OR/Ukd0bsfHJh4ouY4npvQzMNZ2e3m0MU/xsYSv0SUuyjYhYVVAKbBXEp7m9lD9\nIcaeSNlDAgMBAAECggEAG6ACeqC59QkcQH6wGgUEm0i/8HqkSHQDUkn6zh9ZITAK\neSBcgn+ke9/hW4bQw5jMeQTnnrUhewpfhy9DOTtqnxqHY4CGEXx+y8GUiPDJP3hG\nxcU3IEXYcj1CQ7xwl/7ERjI8KqYjl0Grijs5wrHVYCvC+DuLciA6EEqh/yssYjSG\npWeEQIPXuokecWGXR/WgbmWRmMuTtDsqHv90v9yM3PKIOzRJdPP1YoRV2t3hpaDg\nfn/JNE7hCepYgvf1AfEQA8rx/f/kk0LEbALj1wBLNVB9JZrB+MfRC7ZrmV2d91wR\nIMWb6OSA8uxyTeuty3wsP+Vndlg1C2NgYXLAFt67uQKBgQD5ewlhSRcAf2SmPDh5\ne38MibHQ2niZsJR2aNgdCqU9jlM5GWxUd/ayJdmp/C7l5OT6uIHI0EHSF5V3guJH\nGSykkVl6JdGLr0lGUk9WWMYXQEOeNmt6Y028c3wgqrQSBCKAt70/h8JYflZMR2kL\nXEMYt10BZo14rkW0oCOSEb5huwKBgQDhcbYtL0gz2O4UJHdY/9pkKxrgWjGWBirm\n+PGNitSoZWOC1wrmcwVUj1uHZUFDU0cCCTU+5LBWyW2tGMxhg5tOC1+gBfOQTz7r\n0ApgmHZ3c1HfNK7o8EiMjL7Ysl+OEPRRo2ErmLjzo8Z0fKMVJJXNcKAXp9H6qfGX\nuW0QOqAKGQKBgDjCEyo89Ky6Tu26+aY5wHfbw8aeTZ25nK0rwS8qQtm0TZ7J9+ln\nuYpiLhkMNKc84hNgcrZ7Gt5vWyPrdQtz4MI4B0FQ5VGAOY10IHSmkbqsdjXCb8VS\nXlcndu//piQLKMZcBwQzILX9WCjWfkGFZgZzgQdWi40PKPClFjKfMs8NAoGAV6Sj\nVDGbejyNYdtDYqAkwOhZDHtD57UCHMUO8x3TypuP8h+zpx90JQmOZbahhpDrfAkk\nYAz72OF59986JXbKe67EQCvQInwMVBSO1DqxY4K7g3CxxvES40EcOJYvu8UvlkVT\n02UOEfnLfyGtLN0KN9HfCxM8+Jv0xi1aDwMbkJECgYAS1eSXMysQQf07N2xTs3R0\ngc4Qo/lNHOoJPiBnjrPlb6Q5q5bThTEKiqAh0+HtqKCPSNEWnAeY8zfdNpQ+wsRK\nLWW4Jthm1NcFPrrDLNHZLHsdTDTAU1/KQHFMjK4mpEoeeWSNYN0g5hR1MoVFMp3G\nUVHdTOxF9uH5wekd/lhFBw==\n-----END PRIVATE KEY-----\n",
//      "client_email": "firebase-adminsdk-36578@faisal-burger.iam.gserviceaccount.com",
//      "client_id": "108533953420933444036",
//      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//      "token_uri": "https://oauth2.googleapis.com/token",
//      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-36578%40faisal-burger.iam.gserviceaccount.com",
//      "universe_domain": "googleapis.com"
//    };
//     final creds = auth.ServiceAccountCredentials.fromJson(d);
//
//     final client = await auth.clientViaServiceAccount(
//       creds,
//       ['https://www.googleapis.com/auth/cloud-platform'],
//     );
//
//     print('token might be ${client.credentials}');
//
//     final notificationData = {
//       'message': {
//         'token': recipientToken,
//         'notification': {'title': title, 'body': body}
//       },
//     };
//
//     const String senderId = '85924625898';
//     final response = await client.post(
//       Uri.parse('https://fcm.googleapis.com/v1/projects/$senderId/messages:send'),
//       headers: {
//         'content-type': 'application/json',
//       },
//       body: jsonEncode(notificationData),
//     );
//
//     client.close();
//    print(response.body);
//
//     if (response.statusCode == 200) {
//      print('sent message seeeee');
//     }
//
//     return false;
//   }
// }