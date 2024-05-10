import 'package:buildbind/Utills/utills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/chat_model.dart';

class ChatService
{
  ChatService()
  {
    _setupRef();
  }

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;



  CollectionReference? _chatscollection;
  CollectionReference? _chatscollection2;

  _setupRef(){

    var chat_obj=Chat();
    _chatscollection=_firebaseFirestore.collection('chats').withConverter(fromFirestore:(snapshots,_)=>Chat.fromJson(snapshots.data()!),toFirestore: (chat,_)=>chat_obj.toJson());
    _chatscollection2=_firebaseFirestore.collection('chats');

    print('in it');
    print(_chatscollection);
    print(_chatscollection2);

  }

  Future<bool> checkChatExists(String id1,String id2) async
  {
    String chatID= generateChatID(id1: id1, id2: id2);
    final result =await _chatscollection?.doc(chatID).get();

    if(result != null)
      {
        return result.exists;
      }
    return false;
  }

  Future<void> createChat(String id1,String id2) async
  {
    String chatID= generateChatID(id1: id1, id2: id2);
    final chat=Chat(id: chatID, participants: [id1,id2], messages: []);

    print(chat.id);
    print(chat.participants);
    print(chat.messages);

    await FirebaseFirestore.instance.collection('chats').doc(chat.id).set(chat.toJson());

    print('created');


  }
}