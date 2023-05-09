import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StorageHelper {
  StorageHelper._();
  static final instance = StorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(File file) async {
    try {
      String fileName = file.path.split('/').last;
      Reference reference = firebaseStorage.ref('topics/$fileName');
      TaskSnapshot taskSnapshot = await reference.putFile(file);
      String imageUrl = await reference.getDownloadURL();
      return imageUrl;
    } catch(e){
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
      return '';
    }
  }

}