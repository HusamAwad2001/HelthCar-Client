import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../controllers/topic_details_controller.dart';

class TopicDetailsScreen extends GetView<TopicDetailsController> {
  const TopicDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'التفاصيل',
          style: TextStyle(
            fontFamily: 'Expo',
          ),
        ),
        elevation: 0,
      ),
      body: GetBuilder<TopicDetailsController>(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(controller.argument.image),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  controller.argument.title,
                  style: const TextStyle(fontFamily: 'Expo'),
                ),
                subtitle: Text(
                  controller.argument.description,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Expo',
                    fontSize: 12,
                  ),
                ),
              ),
              controller.argument.infoType == 'Text'
                  ? const Divider(thickness: 1, color: primaryColor)
                  : const SizedBox(),
              controller.argument.infoType == 'Image'
                  ? const SizedBox(height: 20)
                  : const SizedBox(),
              controller.argument.infoType == 'Text'
                  ? Text(
                      controller.argument.information,
                      style: const TextStyle(
                        height: 1.5,
                        color: Colors.black,
                        fontFamily: 'Expo',
                      ),
                    ).paddingAll(10)
                  : controller.argument.infoType == 'Image'
                      ? CachedNetworkImage(
                          imageUrl: controller.argument.information,
                          fadeInCurve: Curves.easeIn,
                          height: 220,
                          width: Get.width,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return const SizedBox(
                              height: 220,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const SizedBox(
                              height: 220,
                              child: Center(
                                child: Icon(Icons.error, size: 35),
                              ),
                            );
                          },
                        )
                      : controller.controller!.value.isInitialized
                          ? SafeArea(
                              child: Container(
                                height: 300,
                                width: Get.width,
                                color: Colors.black,
                                child: Chewie(
                                  controller: controller.chewieController!,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 300,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ).marginOnly(top: 50),
                            ),

            ],
          );
        },
      ),
    );
  }
}
