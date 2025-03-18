import 'package:tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infraestructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDataSources {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    //obtenemos los videos, lo transformamos a al modelo de la infraestructura
    // el map funciona para recorrer las listas, al igual que en javascript
    // EL MAP RETO  RNA UNA LISTA DE ITERABLES Y DEBEMOS CONVERTIRLAR EN LIST con toList
    final List<VideoPost> newVideos = videoPosts
        .map(
          (video) => LocalVideoModel.fromJsonToMap(video).toVideoPostEntity(),
        )
        .toList();

    return newVideos;
  }
}
