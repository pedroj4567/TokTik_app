import 'package:tok_tik/domain/entities/video_post.dart';

//aca llamamos al datasources, asi tenemos la capa de seguridad por cambios

abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
