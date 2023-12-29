import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

/// [StatelessWidget] don't have life cycle
/// [StatefulWidget] are the only ones who have it.
class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  /// [initState] First life cycle hook in the State
  @override
  void initState() {
    super.initState();

    /// [widget.videoUrl] widget is the parent that is using this state.
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();

    /// All this is the same as before. But it's easier to see with the cascade operator [..].
    // controller = VideoPlayerController.asset(widget.videoUrl);
    // controller.setVolume(0);
    // controller.setLooping(true);
    // controller.play();
  }

  @override
  Widget build(BuildContext context) {
    // widget.caption; To acces to the properties in the FullScreenPlayer

    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        // Video
        return GestureDetector(
          onTap: () {
            // Try to avoid the else.
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
                // Video
                VideoPlayer(controller),
                // Gradient
                VideoBackground(
                  stops: const [0.8, 1.0],
                ),
                // Text
                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption))
              ],
            ),
          ),
        );
      },
    );
  }

  /// [dispose] Last life cycle hook in the State
  @override
  void dispose() {
    // To avoid memory leaks.
    controller.dispose();

    super.dispose();
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({required this.caption});

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
