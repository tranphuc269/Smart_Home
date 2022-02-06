import 'package:api_example_app/model/base_entity.dart';

class RoomEntity extends BaseEntity {
  RoomEntity(
      {this.id,
      this.name,
      this.description,
      this.code,
      this.image,
      this.idHouse});

  String id;
  String name;
  String image;
  String description;
  String code;
  String idHouse;
}
