import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/controllers/navigation_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemCount: controller.chatDoctors.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.account_circle_rounded,
                size: 45,
              ),
              title: Text(
                '${controller.chatDoctors[index].firstName!} ${controller.chatDoctors[index].secondName!} ${controller.chatDoctors[index].familyName!}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Expo',
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                controller.chatDoctors[index].email!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Expo',
                  fontSize: 15,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 25,
              ),
            );
          },
        );
      },
    );
  }
}
