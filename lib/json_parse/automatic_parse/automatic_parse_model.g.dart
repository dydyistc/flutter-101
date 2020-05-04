// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'automatic_parse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    json['name'] as String,
    json['age'] as int,
    json['gender'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
    };

BasicMap _$BasicMapFromJson(Map<String, dynamic> json) {
  return BasicMap(
    json['code'] as int,
    json['result'] as String,
  );
}

BasicMapWithList _$BasicMapWithListFromJson(Map<String, dynamic> json) {
  return BasicMapWithList(
    json['code'] as int,
    json['result'] as String,
    (json['data'] as List)?.map((e) => e as String)?.toList(),
  );
}

BasicMapWithListModel _$BasicMapWithListModelFromJson(
    Map<String, dynamic> json) {
  return BasicMapWithListModel(
    json['code'] as int,
    json['result'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Student.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BasicMapWithModel _$BasicMapWithModelFromJson(Map<String, dynamic> json) {
  return BasicMapWithModel(
    json['code'] as int,
    json['result'] as String,
    json['data'] == null
        ? null
        : Student.fromJson(json['data'] as Map<String, dynamic>),
  );
}
