String generateChatID({required String id1, required String id2})
{
  List ids =[id1,id2];
  ids.sort();
  String chatID=ids.fold("", (id,uid) => "$id$uid");

  print("chat id is ${chatID}");
  return chatID;
}