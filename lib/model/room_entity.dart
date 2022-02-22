import 'package:api_example_app/model/base_entity.dart';

class RoomEntity extends BaseEntity {
  RoomEntity(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.idHouse});

  factory RoomEntity.fromJson(Map<String, dynamic> json) {
    return RoomEntity(
      id: json['roomId'],
      name: json['roomName'],
      image: json['roomImage'],
      description: json['des'],
      idHouse: json['houseId'],
    );
  }

  String id;
  String name;
  String image;
  String description;
  String idHouse;
}
