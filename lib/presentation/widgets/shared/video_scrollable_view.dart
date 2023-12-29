import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/video/fullscreen_player.dart';
import 'package:tok_tik/presentation/widgets/video_player/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    // Builder to make it work in a custom way. Like lazy loading.
    return PageView.builder(
      scrollDirection: Axis.vertical,
      // This is needed to see the effect in Android.
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video Player && Gradient
            SizedBox.expand(
              // SizeBox.expand to use all the mobie view.
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),

            // Buttons
            Positioned(
                // Positioned is like position absolute in css.
                bottom: 48,
                right: 16,
                child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}
