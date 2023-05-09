import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helth_care_client/services/fb_auth_controller.dart';

class ChatMessage {
  late String content;
  late String senderId;
  late bool isFromMe;

  ChatMessage({required this.content, required this.senderId});

  ChatMessage.fromMap(Map<String, dynamic> map) {
    content = map['content'];
    senderId = map['senderId'];
    isFromMe = map['senderId'] == FbAuthController().getCurrentUser();
  }
  toMap() {
    return {
      'content': content,
      'senderId': senderId,
      'time': FieldValue.serverTimestamp(),
    };
  }
}
