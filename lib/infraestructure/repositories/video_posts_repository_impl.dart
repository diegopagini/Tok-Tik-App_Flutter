import 'package:tok_tik/domain/datasources/video_posts_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_posts_repository.dart';

/// The provider will call this class to get the data.
class VideoPostRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostRepositoryImpl({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    return videosDatasource.getFavoriteVideosByUser(userID);
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    /// The repository is the one in charge to call the datasource.
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
