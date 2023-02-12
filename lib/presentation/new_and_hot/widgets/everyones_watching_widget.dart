import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_homePage_button.dart';
import 'package:netflix_clone/presentation/widgets/video_widget_two.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          'Avatar: The Way of Water',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          'Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
        kHeight50,
        const VideoWidgetTwo(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomHomePageButton(
              icon: Icons.share_outlined,
              title: 'Share',
              iconSize: 25,
              textSize: 15,
            ),
            kwidth20,
            CustomHomePageButton(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 15,
            ),
            kwidth20,
            CustomHomePageButton(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 15,
            ),
            kwidth
          ],
        )
      ],
    );
  }
}
