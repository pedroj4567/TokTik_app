// nos ayduara a mapear la data desde donde venga

import 'package:tok_tik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  // el factory methos, primero mapea desde el json a este modelo
  // aca siempre se maneja la logica de negocio en caso de que no venga la data
  // correctamente
  factory LocalVideoModel.fromJsonToMap(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'] ?? "No video name",
        videoUrl: json['videoUrl'] ?? "No videourl",
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
      );

  // Este mapea de la data del json pasada al modelo a la entidad a usar
  // // este mapa deberia estar en un archivo independiente
  // aca usamos los valores que usa la classe LocalVideoModel
  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );
}
