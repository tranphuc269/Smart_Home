import 'package:api_example_app/model/base_entity.dart';

class UserEntity extends BaseEntity {
  UserEntity(
      {this.email,
      this.userId,
      this.password,
      this.name,
      this.dob,
      this.image,
      this.phone,
      this.surName});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    print('json : ${json}');
    return UserEntity(
      email: json['email'] ?? '',
      userId: json['user_id'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      name: json['name'] ?? '',
      surName: json['sur_name'] ?? '',
      image: json['img'] ?? '',
    );
  }

  factory UserEntity.withNone() {
    return UserEntity(
      email: 'null',
      userId: 'null',
      password: 'null',
      name: 'null',
      surName: 'null',
      image: ''
    );
  }

  @override
  Map<String, dynamic> beforeCreate() {
    return {
      'email': this.email,
      'user_id': this.userId,
      'password': this.password,
      'name': this.name,
      'sur_name': this.surName,
      'dob': this.dob
    };
  }

  String userId;
  String surName;
  String name;
  String email;
  String image;
  String phone;
  DateTime dob;
  String password;
}
