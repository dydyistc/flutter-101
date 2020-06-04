
import 'package:json_annotation/json_annotation.dart';

part 'list_refresh_model.g.dart';

@JsonSerializable()
class Story {
  final List<String> images;
  final int id;
  final String title;
  Story(this.images, this.id, this.title);
  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@JsonSerializable()
class StoryList {
  final List<Story> stories;
  StoryList(this.stories);
  factory StoryList.fromJson(Map<String, dynamic> json) => _$StoryListFromJson(json);
}