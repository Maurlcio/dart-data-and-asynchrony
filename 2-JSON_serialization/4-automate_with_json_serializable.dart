import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id = 0;
  String name = "";
  String email = "";

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
