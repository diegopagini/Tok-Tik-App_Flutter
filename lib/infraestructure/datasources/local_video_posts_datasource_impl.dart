import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infraestructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';
import 'package:tok_tik/domain/datasources/video_posts_datasource.dart';

class LocalVideoDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 1));

    final List<VideoPost> newVideos = videoPosts
        .map((Map<String, dynamic> el) =>
            LocalVideoModel.fromJson(el).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
