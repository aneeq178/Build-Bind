import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? senderID;
  String? content;
  String? messageType;
  Timestamp? sentAt;

  Message({this.senderID, this.content, this.messageType, this.sentAt});

  Message.fromJson(Map<String, dynamic> json) {
    senderID = json['senderID'];
    content = json['content'];
    sentAt = json['sentAt'];
    messageType =json['messageType'];
  }

  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'content': content,
      'messageType': messageType,
      'sentAt': sentAt?.toString(),
    };
  }
}