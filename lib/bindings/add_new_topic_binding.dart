import 'package:get/get.dart';

import '../controllers/add_new_topic_controller.dart';

class AddNewTopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewTopicController>(() => AddNewTopicController());
  }
}
