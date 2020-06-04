// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_refresh_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) {
  return Story(
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['id'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'images': instance.images,
      'id': instance.id,
      'title': instance.title,
    };

StoryList _$StoryListFromJson(Map<String, dynamic> json) {
  return StoryList(
    (json['stories'] as List)
        ?.map(
            (e) => e == null ? null : Story.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoryListToJson(StoryList instance) => <String, dynamic>{
      'stories': instance.stories,
    };
