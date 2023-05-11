import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/routes/routes.dart';
import 'package:helth_care_client/services/firestore_helper.dart';
import 'package:helth_care_client/view/widgets/loading_dialog.dart';

import '../core/global.dart';
import '../core/storage.dart';
import '../models/chat_user.dart';
import '../models/topic_model.dart';
import '../services/fbNotifications.dart';

class NavigationController extends GetxController {
  final searchController = TextEditingController();
  String? deviceToken;

  @override
  void onInit() {
    ss();
    getAllTopics();
    getAllDoctors();
    getAllClients();
    deviceToken = Global.deviceToken;
    super.onInit();
  }

  ss()async{
    await FbNotifications().getDeviceToken().then((value) async{
      await Storage.instance.write('deviceToken', value);
    });
    await FirestoreHelper.fireStoreHelper.getClientInfoById();
    Storage.getData();
    print(Global.user);
  }

  int selectedIndex = 0;

  changeNavigation(int index) {
    selectedIndex = index;
    update();
  }

  List<TopicModel> topics = [];

  Future<void> getAllTopics() async {
    topics = await FirestoreHelper.fireStoreHelper.getAllTopics();
    Get.back();
    update();
  }

  Future<void> deleteTopic(TopicModel topic) async {
    LoadingDialog().dialog();
    await FirestoreHelper.fireStoreHelper.deleteTopic(topic);
    topics.removeWhere((element) => element.id == topic.id);
    Get.back();
    update();
  }

  List<TopicModel> filteredTopics = [];

  void filterTopics({required String input}) {
    filteredTopics = topics
        .where(
            (value) => value.title.toLowerCase().contains(input.toLowerCase()))
        .toList();
    update();
  }

  List<ChatUser> chatDoctors = [];

  getAllDoctors() async {
    chatDoctors = await FirestoreHelper.fireStoreHelper.getAllDoctors();
    update();
  }

  List<ChatUser> chatClients = [];

  getAllClients() async {
    chatClients = await FirestoreHelper.fireStoreHelper.getAllClients();
    update();
  }

  ///
  bool isSubscribe = false;

  Future<void> updateSubscribeTopic(String topicId, bool isSubscribe) async {
    LoadingDialog().dialog();
    await FirestoreHelper.fireStoreHelper.updateHiddenTopic(
      topicId,
      isSubscribe,
    );
    this.isSubscribe = isSubscribe;
    // Get.back();
    // update();
  }

  ///
  void subscribeToTopic(TopicModel topic) async {
    LoadingDialog().dialog();
    if (deviceToken != null || deviceToken != '') {
      isSubscribe = true;
      await updateSubscribeTopic(topic.id!, isSubscribe);
      await FirestoreHelper.fireStoreHelper.subscribeToTopic(
        topic,
        deviceToken!,
      );
      FbNotifications.showNotification(
          title: 'الإشتراك',
          body: 'تم الإشتراك في "${topic.title}"'
      );
    }
      Get.offAllNamed(Routes.patentsNavigationScreen);
    // update();
  }

  ///
  void unSubscribeToTopic(TopicModel topic) async {
    LoadingDialog().dialog();
    if (deviceToken != null || deviceToken != '') {
      isSubscribe = false;
      await updateSubscribeTopic(topic.id!, isSubscribe);
      await FirestoreHelper.fireStoreHelper.unSubscribeToTopic(topic);
      FbNotifications.showNotification(
        title: 'الإشتراك',
        body: 'تم إلغاء الإشتراك في "${topic.title}"'
      );
    }
    Get.offAllNamed(Routes.patentsNavigationScreen);
    // update();
  }
}
