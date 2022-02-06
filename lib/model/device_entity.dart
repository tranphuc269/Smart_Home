import 'package:api_example_app/model/base_entity.dart';

class DeviceEntity extends BaseEntity {
  DeviceEntity(
      {this.name,
      this.value,
      this.id,
      this.images,
      this.type,
      this.status,
      this.idRoom});

  String id;
  String name;
  String idRoom;
  String status;
  String images;
  double value;
  String type;
}
