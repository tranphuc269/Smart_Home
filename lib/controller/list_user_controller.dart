import 'package:api_example_app/model/user_entity.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:get/get.dart';

class ListUserController extends GetxController{
  final listUser = List<UserEntity>.empty(growable: true).obs;
  final _repoUser = BaseRepository(collectionName: 'users');
  @override
  void onInit() async{
    listUser.value = await _repoUser.getAll((e) => UserEntity.fromJson(e));
    // TODO: implement onInit
    super.onInit();
  }

}