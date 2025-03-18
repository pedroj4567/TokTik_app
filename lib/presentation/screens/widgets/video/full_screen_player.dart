import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/screens/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  // para acceder a los valores a menajar usamos el
  // widget. <Campo a buscar>

  late VideoPlayerController controller;

  //manejos cuando se monta el widget
  @override
  void initState() {
    // primero se inicializa el widget
    super.initState();

    // usamos la opercaiones del videoController
    // usamos el controlador y usamos el video player
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true) // siempre se repiten
      ..setVolume(0) // sin volumne
      ..play(); // inicia la app

    // si el widget se contruye, casi siempre se destruye
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        // snaptchop es el estado del future
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: Colors.amber,
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                VideoBackground(
                  stops: const [0.8, 1.0],
                ),
                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(
                      caption: widget.caption,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  //SIEMPRE PENDIENTE DE ESTO, DEBIDO A QUE SI NO SE DESMONTAD A
  // CONSUMIRA MEMORIA
  // despues de montarse se usa el dispose para desmontarlo al final
  @override
  void dispose() {
    // desmontamos el controllador usado
    controller.dispose();
    super.dispose();
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({
    required this.caption,
  });

  // para tomar la medidad de la pantalla que estemos usando
  // usamos el MediaQuery.if(context).size

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
