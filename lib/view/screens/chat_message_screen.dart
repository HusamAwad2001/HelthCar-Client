import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/constants/app_styles.dart';
import 'package:helth_care_client/constants/constants.dart';
import 'package:helth_care_client/controllers/chat_controller.dart';

import '../../models/chat_message.dart';
import '../../models/chat_user.dart';
import '../../services/firestore_helper.dart';

class ChatMessageScreen extends StatelessWidget {
  ChatUser otherUser = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          '${otherUser.firstName!} ${otherUser.secondName!} ${otherUser.familyName!}',
          style: getSemiBoldStyle(),
        ),
      ),
      body: GetBuilder<ChatController>(
        builder: (provider) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: StreamBuilder<List<ChatMessage>>(
                  stream: FirestoreHelper.fireStoreHelper
                      .getAllChatMessage(otherUser.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return snapshot.data![index].isFromMe
                                  ? ChatBubble(
                                      clipper: ChatBubbleClipper1(
                                          type: BubbleType.sendBubble),
                                      alignment: Alignment.topRight,
                                      margin: const EdgeInsets.only(top: 20),
                                      backGroundColor: Colors.blue,
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                        ),
                                        child: Text(
                                          snapshot.data![index].content,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : ChatBubble(
                                      clipper: ChatBubbleClipper1(
                                          type: BubbleType.receiverBubble),
                                      backGroundColor: const Color(0xffE7E7ED),
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                        ),
                                        child: Text(
                                          snapshot.data![index].content,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    );
                        },
                      );
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'ابدأ المراسلة الآن',
                          style: getRegularStyle(color: Colors.black),
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: double.infinity),
                          const Icon(
                            Icons.warning_amber,
                            color: Colors.grey,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'حدث خطأ ما',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              sendMessage(provider),
            ],
          );
        },
      ),
    );
  }

  Container sendMessage(ChatController provider) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: provider.messageContentController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                hintText: 'اكتب رسالتك هنا...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              provider.sendMessage(otherUser.id!);
              provider.messageContentController.clear();
            },
            icon: const Icon(
              Icons.send,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
