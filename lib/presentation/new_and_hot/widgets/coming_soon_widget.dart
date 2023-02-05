import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_homePage_button.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'WINNIE THE POOH',
                    style: TextStyle(
                      letterSpacing: -1,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: const [
                      CustomHomePageButton(
                        icon: Icons.notifications_none,
                        title: 'Remind me',
                        iconSize: 25,
                        textSize: 15,
                      ),
                      kwidth,
                      CustomHomePageButton(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 25,
                        textSize: 15,
                      ),
                      kwidth,
                    ],
                  )
                ],
              ),
              kHeight,
              const Text(
                'Coming on Friday',
                style: TextStyle(fontSize: 15),
              ),
              kHeight,
              const Text(
                'Winnie The Pooh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                'Christopher Robin is headed off to college and he has abandoned his old friends, Pooh and Piglet, which then leads to the duo embracing their inner monsters.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
