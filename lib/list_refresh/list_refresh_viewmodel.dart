
import 'dart:async';
import 'package:flutter101/list_refresh/list_refresh_model.dart';
import 'package:flutter101/list_refresh/list_refresh_repository.dart';

class RefreshListViewModel {
  ListRefreshRepository repository = ListRefreshRepository();

  StreamController<List<Story>> _storyStreamController = StreamController.broadcast();
  Stream<List<Story>> get storyStream => _storyStreamController.stream;

  int _offset = 0;
  List<Story> stories = [];

  refresh() {
    repository
      .fetchStories(0)
      .then((newStories) {
        _offset = 0;
        this.stories = newStories;
        _storyStreamController.add(this.stories);
      })
      .catchError((error) {
        // TODO: handle error
    });
  }

  loadMore() {
    repository
      .fetchStories(_offset + 1)
      .then((newStories) {
        _offset++;
        this.stories.addAll(newStories);
        _storyStreamController.add(this.stories);
      })
      .catchError((error) {
        // TODO: handle error
      });
  }

  dipsose() {
    _storyStreamController.close();
  }
}