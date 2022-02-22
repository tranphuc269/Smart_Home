import 'package:api_example_app/global_data/global_data.dart';
import 'package:api_example_app/model/room_entity.dart';
import 'package:api_example_app/model/user_entity.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BodyController extends GetxController {
  final listRoom = List<RoomEntity>.empty(growable: true).obs;
  final _repo = BaseRepository(collectionName: 'rooms');
  final _repoUser = BaseRepository(collectionName: 'users');
  final user = UserEntity.withNone().obs;

  @override
  Future<void> onInit() async {
    user.value = await _repoUser.getByDocumentId(FirebaseAuth.instance.currentUser.uid, (e) => UserEntity.fromJson(e));
    listRoom(await _repo.getAll((e) => RoomEntity.fromJson(e)));
    listRoom.value
        .removeWhere((element) => element.idHouse != GlobalData.houseId);
    // TODO: implement onInit
    super.onInit();
  }
}
