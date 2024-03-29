import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/services/firestore_helper.dart';
import 'package:video_player/video_player.dart';

import '../models/topic_model.dart';

class TopicDetailsController extends GetxController {
  TopicModel argument = Get.arguments;
  VideoPlayerController? controller;

  ChewieController? chewieController;

  addView() async{
    FirestoreHelper.fireStoreHelper.addView(argument);
  }
  @override
  void onInit() {
    addView();
    controller = VideoPlayerController.network(
      argument.infoType == "Video" ? argument.information : '',
    )..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: controller!,
          autoPlay: true,
        );
        update();
      });
    super.onInit();
  }

  @override
  void onClose() {
    controller!.dispose();
    super.onClose();
  }
}
