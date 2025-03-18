import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  // manejamos toda la logica
  // Esto hace referencia a un singleton.

  // no importa de donde vienen los datos, solo sirve los datos
  final VideoPostRepository videoPostRepository;

  DiscoverProvider({
    required this.videoPostRepository,
  });
  // al provider no le importa de donde viene los datos,
  // el solo necesita poder tomar la informacion que necesita
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //Todo: Cargar videos
    // await Future.delayed(
    //   const Duration(seconds: 2),
    // );

    // agregamo a la lista los nuevos videos n
    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    // Con este le indicamos el cambio en el
    // proveedor
    notifyListeners();
  }
}
