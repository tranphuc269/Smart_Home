import 'package:api_example_app/model/base_entity.dart';

class HouseEntity extends BaseEntity {
  HouseEntity(
      {this.image,
      this.code,
      this.description,
      this.name,
      this.id,
      this.createdDate,
      this.updatedDate});

  String id;
  String name;
  String image;
  String description;
  String code;
  DateTime createdDate;
  DateTime updatedDate;
}
