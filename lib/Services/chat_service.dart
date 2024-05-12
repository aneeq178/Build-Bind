import 'dart:async';

import 'package:buildbind/Controllers/chat_controller.dart';
import 'package:buildbind/Models/message_model.dart';
import 'package:buildbind/Utills/utills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../Models/chat_model.dart';

class ChatService extends ChangeNotifier{
  ChatService() {
    _setupRef();
  }

  List<Message> messagesList = [];




  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  CollectionReference? _chatscollection;
  CollectionReference? _chatscollection2;

  _setupRef() {
    var chat_obj = Chat();
    _chatscollection = _firebaseFirestore.collection('chats').withConverter(
        fromFirestore: (snapshots, _) => Chat.fromJson(snapshots.data()!),
        toFirestore: (chat, _) => chat_obj.toJson());
    _chatscollection2 = _firebaseFirestore.collection('chats');

    print('in it');
    print(_chatscollection);
    print(_chatscollection2);
  }

  Future<bool> checkChatExists(String id1, String id2) async
  {
    String chatID = generateChatID(id1: id1, id2: id2);
    final result = await _chatscollection?.doc(chatID).get();

    if (result != null) {
      return result.exists;
    }
    return false;
  }

  Future<void> createChat(String id1, String id2,BuildContext context) async
  {
    String chatID = generateChatID(id1: id1, id2: id2);
    final chat = Chat(id: chatID, participants: [id1, id2], messages: []);

    print(chat.id);
    print(chat.participants);
    print(chat.messages);

    await FirebaseFirestore.instance.collection('chats').doc(chat.id).set(
        chat.toJson());


    var ctrl=ChatController();

    ctrl.createChat(id2, chatID, context);

    print('created');
  }

  sendChatMessage(String id1, String id2, Message message) async
  {
    String chatID = generateChatID(id1: id1, id2: id2);

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('chats').doc(chatID);

    // Get the current messages array
    DocumentSnapshot documentSnapshot = await documentReference.get();
    List<dynamic> messages = documentSnapshot['messages'];

    messages.add(message.toJson());

    await documentReference.update({'messages': messages});
  }


  getChatMessages(String id1, String id2,) async {

    String chatID = generateChatID(id1: id1, id2: id2);


    try {
      // Get the document snapshot for the specified chatId
      messagesList.clear();

      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatID)
          .get();

      // Check if the document exists
      if (snapshot.exists) {
        // Retrieve the 'messages' array from the document data
        List<dynamic> messageData = snapshot.data()!['messages'];

        // Convert each message data to ChatMessage object
        messagesList.clear();
        messageData.forEach((data) {
          messagesList.add(Message.fromJson(data));
        });

        print(messagesList.length);
        print(messagesList.first.content.toString());

        notifyListeners();
      }
    } catch (e) {
      print('Error retrieving chat messages: $e');
    }

    return messagesList;
  }


  Stream<List<Message>> getChatMessagess(String id1, String id2) {
    String chatID = generateChatID(id1: id1, id2: id2);

    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatID)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        List<dynamic> messageData = snapshot.data()!['messages'];
        return messageData.map((data) => Message.fromJson(data)).toList();
      } else {
        return []; // Return an empty list if the document doesn't exist
      }
    });
  }

// Usage
  StreamSubscription<List<Message>>? messagesSubscription;

  void printChatMessages(String id1, String id2) async {
    Stream<List<Message>> messageStream = getChatMessagess(id1, id2);

    await for (List<Message> messages in messageStream) {
      // Print each message
      messagesList.clear();
      messagesList=messages;
      notifyListeners();
      messages.forEach((message) {
        print('Sender: ${message.senderID}, Content: ${message.content}');
      });
    }
  }

}