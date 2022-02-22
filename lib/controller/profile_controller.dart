import 'package:api_example_app/controller/body_controller.dart';
import 'package:api_example_app/model/user_entity.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  final userProfile = UserEntity.withNone().obs;
  final _repoUser = BaseRepository(collectionName: 'users');

  @override
  Future<void> onInit() async{
    // TODO: implement onInit
    final _json = await (FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid)).get();
    userProfile.value = UserEntity.fromJson(_json.data());
    super.onInit();
  }

  Future<void> updateProfile() async{
    SmartDialog.showLoading(msg: 'Cập nhật...');
    _repoUser.updateByDocumentId(userProfile.value, FirebaseAuth.instance.currentUser.uid);
    Get.find<BodyController>().user(userProfile.value);
    SmartDialog.dismiss();
  }
}