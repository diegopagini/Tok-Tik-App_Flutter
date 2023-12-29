import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infraestructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';

/// [ChangeNotifier] is required to create a provider.
class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSource
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    final List<VideoPost> newVideos = videoPosts
        .map((Map<String, dynamic> el) =>
            LocalVideoModel.fromJson(el).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
