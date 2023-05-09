import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/services/fb_auth_controller.dart';

import '../models/app_user.dart';
import '../models/chat_message.dart';
import '../models/chat_user.dart';
import '../models/topic_model.dart';
import '../view/widgets/loading_dialog.dart';

class FirestoreHelper {
  static FirestoreHelper fireStoreHelper = FirestoreHelper();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addUserToFirestore(AppUser appUser) async {
    LoadingDialog().dialog();
    await firebaseFirestore
        .collection('clients')
        .doc(appUser.id)
        .set(appUser.toJson());
    Get.back();
  }

  /// Get_All_Topics
  Future<List<TopicModel>> getAllTopics() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection('topics').get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          querySnapshot.docs;
      List<TopicModel>? topics = documents.map((e) {
        TopicModel topic = TopicModel.fromJson(e.data());
        topic.id = e.id;
        return topic;
      }).toList();
      return topics;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
    return [];
  }

  /// Delete_One_Topic
  Future<void> deleteTopic(TopicModel topic) async {
    await firebaseFirestore.collection('topics').doc(topic.id).delete();
  }

  /// Get_All_Doctors
  Future<List<ChatUser>> getAllDoctors() async {
    QuerySnapshot<Map<String, dynamic>> results =
        await firebaseFirestore.collection('doctors').get();
    List<ChatUser> users = results.docs.map((e) {
      return ChatUser.fromMap(e.data());
    }).toList();
    users.removeWhere(
      (element) => element.id == FbAuthController().getCurrentUser(),
    );
    return users;
  }

  /// Get_All_Clients
  Future<List<ChatUser>> getAllClients() async {
    QuerySnapshot<Map<String, dynamic>> results =
    await firebaseFirestore.collection('clients').get();
    List<ChatUser> users = results.docs.map((e) {
      return ChatUser.fromMap(e.data());
    }).toList();
    users.removeWhere(
          (element) => element.id == FbAuthController().getCurrentUser(),
    );
    return users;
  }

  sendMessage(ChatMessage message, String otherUserId) async {
    String collectionId = getChatId(otherUserId);
    firebaseFirestore
        .collection('chats')
        .doc(collectionId)
        .collection('messages')
        .add(message.toMap());
  }

  String getChatId(String otherId) {
    String myId = FbAuthController().getCurrentUser();
    int myHashCode = myId.hashCode;
    int otherHashCode = otherId.hashCode;
    String collectionId =
    myHashCode > otherHashCode ? '$myId$otherId' : '$otherId$myId';
    return collectionId;
  }

  Stream<List<ChatMessage>> getAllChatMessage(String otherUserId) {
    String collectionId = getChatId(otherUserId);
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = firebaseFirestore
        .collection('chats')
        .doc(collectionId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
    return stream.map((event) {
      List<ChatMessage> messages = event.docs.map((e) {
        return ChatMessage.fromMap(e.data());
      }).toList();
      return messages;
    });
  }
}
