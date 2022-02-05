import 'package:api_example_app/model/user_entity.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _repo = BaseRepository(collectionName: 'users');
  UserEntity userEntity = UserEntity.withNone();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> register() async {
    final user = (await _auth.createUserWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    ))
        .user;
    updateUserProfile(user.uid);
  }

  Future<void> updateUserProfile(String documentId) async {
    userEntity.userId = documentId;
    _repo.createByDocumentId(userEntity, documentId);
  }
}