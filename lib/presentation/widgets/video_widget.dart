import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: Image.network(
            newAndHotTempImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.3),
            radius: 15,
            child: IconButton(
              iconSize: 15,
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
