import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/screens/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/screens/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    // este widget permite un scroll a pantalla completa
    // El por defecto toma todo el alto y ancho de la pantalla completa
    return PageView.builder(
      // en android el efecto de remove no lo tiene,
      // asi que hay que anexarlos de esta manera
      physics: const BouncingScrollPhysics(),

      // con el scrollDirection : Axis. vertiocal o horizontal podemos darle la direccioo de scrooling
      scrollDirection: Axis.vertical,

      //cantidad de elementos a revisar
      itemCount: videos.length,
      itemBuilder: (context, index) {
        // referencia a los videos por cada uno
        final VideoPost video = videos[index];

        return Stack(
          children: [
            // video player + gradientes
            // con el SizedBox. expand -> expande a toda la pantalla
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: video.caption,
                videoUrl: video.videoUrl,
              ),
            ),
            // botones

            Positioned(
              bottom: 40,
              right: 40,
              child: VideoButtons(video: video),
            )
          ],
        );
      },
    );
  }
}
