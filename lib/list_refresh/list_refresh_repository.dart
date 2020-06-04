
import 'package:dio/dio.dart';
import 'package:flutter101/list_refresh/list_refresh_model.dart';

class ListRefreshRepository {
  Dio dio = Dio();

  Future<List<Story>> fetchStories(int offset) async {
    var url = 'https://news-at.zhihu.com/api/4/news/before/' + _constructOffsetParam(offset);
    Response response = await dio.get(url);
    return StoryList.fromJson(response.data).stories;
  }

  static String _constructOffsetParam(int offset) {
    var targetDate = DateTime.now();
    targetDate = targetDate.add(Duration(days: 1));
    targetDate = targetDate.subtract(Duration(days: offset));
    return "${targetDate.year}${_fixParam(targetDate.month)}${_fixParam(targetDate.day)}";
  }

  static String _fixParam(int time) {
    String timeStr = time.toString();
    timeStr = timeStr.length > 1 ? timeStr : "0" + timeStr;
    return timeStr;
  }
}