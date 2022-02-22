import 'package:api_example_app/LandingScreen/landing_screen.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _repo = BaseRepository(collectionName: 'users');
  String email = '';
  String password = '';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> login(BuildContext context) async {
    SmartDialog.showLoading(msg: 'Đăng nhập...');
    final _user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    SmartDialog.dismiss();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LandingScreen()));
  }
}
