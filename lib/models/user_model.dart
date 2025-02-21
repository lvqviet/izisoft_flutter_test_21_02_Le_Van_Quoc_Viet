// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    this.email,
    this.name,
    this.avatar,
    this.gender,
    this.describe,
    this.job,
    this.password,
  });

  String id;
  String? email;
  String? name;
  String? avatar;
  String? gender;
  String? describe;
  String? job;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
