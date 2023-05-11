import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/global.dart';
import '../core/storage.dart';
import '../models/chat_user.dart';
import '../routes/routes.dart';
import '../view/widgets/loading_dialog.dart';
import '../view/widgets/snack.dart';

class FbAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// CREATE ACCOUNT
  Future<bool> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'Something went wrong, try again!',
        backgroundColor: Colors.red,
      );
      _controllerExceptionCode(e.code);
    } catch (e) {}
    return false;
  }

  /// SIGN-IN
  Future<bool> signIn({
    required String email,
    required String password,
    required String firstName,
    required String secondName,
    required String familyName,
    required String phone,
    required String address,
    required String birthDate,
    required String typeOfInAccount,
  }) async {
    LoadingDialog().dialog();
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Snack().show(type: true, message: 'تم تسجيل الدخول بنجاح');
      Global.isLogged = true;
      Global.user = {
        'id': FbAuthController().getCurrentUser(),
        'firstName': firstName.trim(),
        'secondName': secondName.trim(),
        'familyName': familyName.trim(),
        'email': email.trim(),
        'phone': phone..trim(),
        'address': address..trim(),
        'birthDate': birthDate..trim(),
        'password': password.trim(),
        'typeOfInAccount': typeOfInAccount,
      };
      Storage.instance.write("isLogged", Global.isLogged);
      Storage.instance.write("user", Global.user);
      Get.offAllNamed(Routes.patentsNavigationScreen);
      print('Routes.patentsNavigationScreen');
      print(Global.user);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.back();
      // Get.snackbar(
      //   'Error',
      //   e.message ?? 'Something went wrong, try again!',
      //   backgroundColor: Colors.red,
      // );
      _controllerExceptionCode(e.code);
    } catch (e) {
      print(e);
      Get.back();
    }
    return false;
  }

  /// SIGN-OUT
  Future<void> signOut() async {
    _auth.signOut();
  }

  /// CONTROLLER-EXCEPTION-CODE
  void _controllerExceptionCode(String code) {
    if (code == 'email-already-in-use') {
      print('email-already-in-use');
      Get.snackbar(
        'EXCEPTION',
        'email-already-in-use',
        backgroundColor: Colors.red,
      );
    } else if (code == 'invalid-email') {
      Get.snackbar(
        'EXCEPTION',
        'invalid-email',
        backgroundColor: Colors.red,
      );
    } else if (code == 'operation-not-allowed') {
      Get.snackbar(
        'EXCEPTION',
        'operation-not-allowed',
        backgroundColor: Colors.red,
      );
    } else if (code == 'weak-password') {
      Get.snackbar(
        'EXCEPTION',
        'weak-password',
        backgroundColor: Colors.red,
      );
    } else if (code == 'user-disabled') {
      Get.snackbar(
        'EXCEPTION',
        'user-disabled',
        backgroundColor: Colors.red,
      );
    } else if (code == 'user-not-found') {
      Get.snackbar(
        'EXCEPTION',
        'user-not-found',
        backgroundColor: Colors.red,
      );
    } else if (code == 'wrong-password') {
      Get.snackbar(
        'EXCEPTION',
        'wrong-password',
        backgroundColor: Colors.red,
      );
    } else if (code == 'auth/missing-android-pkg-name') {
      Get.snackbar(
        'EXCEPTION',
        'auth/missing-android-pkg-name',
        backgroundColor: Colors.red,
      );
    } else if (code == 'auth/missing-continue-uri') {
      Get.snackbar(
        'EXCEPTION',
        'auth/missing-continue-uri',
        backgroundColor: Colors.red,
      );
    } else if (code == 'auth/missing-ios-bundle-id') {
      Get.snackbar(
        'EXCEPTION',
        'auth/missing-ios-bundle-id',
        backgroundColor: Colors.red,
      );
    } else if (code == 'auth/invalid-continue-uri') {
      Get.snackbar(
        'EXCEPTION',
        'auth/invalid-continue-uri',
        backgroundColor: Colors.red,
      );
    } else if (code == 'auth/unauthorized-continue-uri') {
      Get.snackbar(
        'EXCEPTION',
        'auth/unauthorized-continue-uri',
        backgroundColor: Colors.red,
      );
    } else if (code == 'auth/user-not-found') {
      Get.snackbar(
        'EXCEPTION',
        'auth/user-not-found',
        backgroundColor: Colors.red,
      );
    }
  }

  /// Get_Current_User
  String getCurrentUser() {
    return _auth.currentUser!.uid;
  }
}
