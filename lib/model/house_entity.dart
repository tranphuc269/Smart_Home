import 'package:api_example_app/model/base_entity.dart';

class HouseEntity extends BaseEntity {
  HouseEntity({
    this.image,
    this.password,
    this.description,
    this.name,
    this.id,
  });

  factory HouseEntity.fromJson(Map<String, dynamic> json) {
    return HouseEntity(
        id: json['houseId'],
        password: json['password'],
        description: json['description'] ?? '',
        name: json['houseName'],
        image: json['houseImage']);
  }

  String id;
  String name;
  String image;
  String description;
  String password;
}
