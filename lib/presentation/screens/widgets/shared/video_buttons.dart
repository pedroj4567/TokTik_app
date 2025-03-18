import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/theme/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          iconColor: Colors.red,
          iconData: Icons.favorite,
          value: video.likes,
        ),
        _CustomIconButton(
          iconColor: Colors.white,
          iconData: Icons.remove_red_eye_outlined,
          value: video.likes,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(
            seconds: 5,
          ),
          child: _CustomIconButton(
            iconData: Icons.play_circle_outline,
            iconColor: Colors.white,
            value: 0,
          ),
        )
      ],
    );
  }
}

//  subwidget
class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CustomIconButton({
    required this.iconData,
    required this.value,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData),
          color: color,
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(
              value.toDouble(),
            ),
            style: TextStyle(
              color: color,
            ),
          )
      ],
    );
  }
}
