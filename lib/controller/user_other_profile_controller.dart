import 'package:api_example_app/model/user_entity.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OtherUserController extends GetxController{
  final userProfile = UserEntity.withNone().obs;
  final _repoUser = BaseRepository(collectionName: 'users');

  @override
  Future<void> onInit() async{
    // TODO: implement onInit
    print('Get.arguments : ${Get.arguments}');
    final _json = await (FirebaseFirestore.instance.collection('users').doc(Get.arguments)).get();
    userProfile.value = UserEntity.fromJson(_json.data());
    super.onInit();
  }
}