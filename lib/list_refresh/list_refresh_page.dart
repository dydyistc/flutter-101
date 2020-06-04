import 'package:flutter/material.dart';
import 'package:flutter101/list_refresh/list_refresh_model.dart';
import 'package:flutter101/list_refresh/list_refresh_viewmodel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListRefreshPage extends StatefulWidget {
  @override
  _ListRefreshPageState createState() => _ListRefreshPageState();
}

class _ListRefreshPageState extends State<ListRefreshPage> {
  RefreshListViewModel _viewModel = RefreshListViewModel();

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
    _viewModel.storyStream.listen((event) {
      _refreshController.refreshCompleted(resetFooterState: true);
      _refreshController.loadComplete();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _viewModel.dipsose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Refresh'),
      ),
      body: SmartRefresher(
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: () => _viewModel.refresh(),
        onLoading: () => _viewModel.loadMore(),
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: _viewModel.stories.length,
            itemBuilder: (context, index) {
              return _buildRow(_viewModel.stories[index]);
            }),
      ),
    );

    // 疑问: 为啥用 StreamBuilder 包装一层时无法上下拉刷新？
//    return Scaffold(
//      appBar: AppBar(title: Text('List Refresh'),),
//      body: SmartRefresher(
//        controller: _refreshController,
//        enablePullDown: true,
//        enablePullUp: true,
//        onRefresh: () => _viewModel.refresh(),
//        onLoading: () => _viewModel.loadMore(),
//        child: StreamBuilder(
//          stream: _viewModel.storyStream,
//          builder: (context, snapshot) {
//            List stories = snapshot.data ?? [];
//            return ListView.builder(
//              padding: EdgeInsets.symmetric(horizontal: 10),
//              itemCount: stories.length,
//              itemBuilder: (context, index) {
//                return _buildRow(stories[index]);
//            });
//          },
//        ),
//      )
//    );
  }

  Widget _buildRow(Story story) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                story.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Image.network(
              story.images[0],
              width: 70,
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
