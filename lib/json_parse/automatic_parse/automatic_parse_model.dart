import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'automatic_parse_model.g.dart';

@JsonSerializable()
class Student {
  String name;
  int age;

  @JsonKey(required: false)
  String gender;


  Student(this.name, this.age, this.gender);
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  String toString() {
    return 'name: $name, age: $age';
  }
}

class BasicList {
  List<Student> students;

  BasicList(this.students);
  factory BasicList.fromJson(List<dynamic> json) {
    return BasicList(json.map((i) => Student.fromJson(i)).toList(),);
  }

  @override
  String toString() {
    return '$students';
  }
}

@JsonSerializable(createToJson: false)
class BasicMap {
  int code;
  String result;

  BasicMap(this.code, this.result);
  factory BasicMap.fromJson(Map<String, dynamic> json) => _$BasicMapFromJson(json);

  @override
  String toString() {
    return 'code: $code, result: $result';
  }
}

@JsonSerializable(createToJson: false)
class BasicMapWithList {
  int code;
  String result;
  List<String> data;

  BasicMapWithList(this.code, this.result, this.data);
  factory BasicMapWithList.fromJson(Map<String, dynamic> json) => _$BasicMapWithListFromJson(json);

  @override
  String toString() {
    return 'code: $code, result: $result, data: ${data.toString()}';
  }
}

@JsonSerializable(createToJson: false)
class BasicMapWithListModel {
  int code;
  String result;
  List<Student> data;

  BasicMapWithListModel(this.code, this.result, this.data);
  factory BasicMapWithListModel.fromJson(Map<String, dynamic> json) => _$BasicMapWithListModelFromJson(json);

  @override
  String toString() {
    return 'code: $code, result: $result, data: ${data.toString()}';
  }
}

@JsonSerializable(createToJson: false)
class BasicMapWithModel {
  int code;
  String result;
  Student data;

  BasicMapWithModel(this.code, this.result, this.data);
  factory BasicMapWithModel.fromJson(Map<String, dynamic> json) => _$BasicMapWithModelFromJson(json);

  @override
  String toString() {
    return 'code: $code, result: $result, data: ${data.toString()}';
  }
}