import 'package:api_example_app/model/base_entity.dart';

class UserHouseEntity extends BaseEntity {
  UserHouseEntity({this.id, this.idHouse, this.idUser});

  String id;
  String idHouse;
  String idUser;
}
