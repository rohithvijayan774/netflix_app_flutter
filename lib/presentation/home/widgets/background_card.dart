import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_homePage_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              color: kBlackColor,
              image: DecorationImage(image: NetworkImage(kMainImage))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomHomePageButton(
                  icon: Icons.add,
                  title: 'My List',
                ),
                playButton(),
                CustomHomePageButton(icon: Icons.info_outline, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton playButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(color: kBlackColor, fontSize: 18),
        ),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
    );
  }
}
