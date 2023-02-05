import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomHomePageButton extends StatelessWidget {
  const CustomHomePageButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 30,
        ),
        Text(title),
      ],
    );
  }
}