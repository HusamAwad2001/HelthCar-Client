import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/view/widgets/loading_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../models/topic_model.dart';
import '../services/firestore_helper.dart';
import '../services/storage_helper.dart';
import '../view/widgets/snack.dart';

class AddNewTopicController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final informationController = TextEditingController();
  String typeOfInformation = "Text";

  XFile? _pickedFile;
  final ImagePicker _picker = ImagePicker();

  /// Pick_Image
  File? imageFile;

  Future<void> pickImage() async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      imageFile = File(_pickedFile!.path);
    } else {
      Snack().show(type: false, message: 'من فضلك قم بإختيار أيقومة من المعرض');
    }
    update();
  }

  /// Pick_Info_Image
  File? imageInfoFile;

  Future<void> pickInfoImage() async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      imageInfoFile = File(_pickedFile!.path);
      print(imageInfoFile);
    } else {
      Snack().show(type: false, message: 'من فضلك قم بإختيار صورة من المعرض');
    }
    update();
  }

  /// Pick_Info_Video
  File? videoInfoFile;
  String? videoNameFile;

  Future<void> pickInfoVideo() async {
    _pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (_pickedFile != null) {
      videoInfoFile = File(_pickedFile!.path);
      videoNameFile = _pickedFile!.name;
    } else {
      Snack().show(type: false, message: 'من فضلك قم بإختيار فيديو من المعرض');
    }
    update();
  }

  String? information;
  Future<void> addNewTopic() async {
    LoadingDialog().dialog();
    String? imageUrl;
    if (imageFile != null) {
      imageUrl = await StorageHelper.instance.uploadImage(imageFile!);
    }
    if (typeOfInformation == "Text") {
      if (informationController.text.isNotEmpty) {
        information = informationController.text;
      }
    } else if (typeOfInformation == "Image") {
      if (imageInfoFile != null) {
        information = await StorageHelper.instance.uploadImage(imageInfoFile!);
      }
    } else {
      if (videoInfoFile != null) {
        information = await StorageHelper.instance.uploadImage(videoInfoFile!);
      }
    }
    TopicModel newTopic = TopicModel(
      title: titleController.text,
      description: descriptionController.text,
      image: imageUrl!,
      information: information!,
      infoType: typeOfInformation,
    );
    await FirestoreHelper.fireStoreHelper.addNewTopic(newTopic);
    update();
  }

  validate() async{
    FocusManager.instance.primaryFocus?.unfocus();
    if (imageFile != null) {
      if (titleController.text.isNotEmpty) {
        if (descriptionController.text.isNotEmpty) {
          if (typeOfInformation == "Text") {
            if (informationController.text.isNotEmpty) {
              // information = informationController.text;
              addNewTopic();
            } else {
              Snack().show(type: false, message: 'يجب إضافة البيانات');
            }
          } else if (typeOfInformation == "Image") {
            if (imageInfoFile != null) {
              // information = await StorageHelper.instance.uploadImage(imageInfoFile!);
              addNewTopic();
            } else {
              Snack().show(type: false, message: 'يجب إختيار صورة');
            }
          } else {
            if (videoInfoFile != null) {
              // information = await StorageHelper.instance.uploadImage(videoInfoFile!);
              addNewTopic();
            } else {
              Snack().show(type: false, message: 'يجب إختيار فيديو');
            }
          }
        } else {
          Snack().show(type: false, message: 'يجب إضافة الوصف');
        }
      } else {
        Snack().show(type: false, message: 'يجب إضافة العنوان');
      }
    } else {
      Snack().show(type: false, message: 'يجب إختيار صورة');
    }
  }
}
