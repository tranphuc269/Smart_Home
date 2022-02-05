import 'package:api_example_app/model/base_entity.dart';

class UserEntity extends BaseEntity {
  UserEntity(
      {this.email,
      this.userId,
      this.password,
      this.name,
      this.dob,
      this.surName});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json['email'],
      userId: json['user_id'],
      password: json['password'],
      name: json['name'],
      surName: json['sur_name'],
      dob: DateTime.parse(json['dob'].toString()),
    );
  }

  factory UserEntity.withNone() {
    return UserEntity(
      email: null,
      userId: null,
      password: null,
      name: null,
      surName: null,
      dob: null,
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
  DateTime dob;
  String password;
}
