import 'package:tok_tik/domain/entities/video_post.dart';

// la implementacion de este, es de donde se obtiene los datos
// aca no importa de donde venga, sino
// que cumpla con las implementaciones de esta clase
abstract class VideoPostDataSources {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
