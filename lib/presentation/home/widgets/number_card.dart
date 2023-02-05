import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
                height: 200,
              ),
              Container(
                width: 130,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: kBorderRadius15,
                    color: Colors.black.withOpacity(0.1),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/original/kGgB1AiOogVfAmMokukr9kIJZCJ.jpg'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: -20,
            child: BorderedText(
              strokeColor: Colors.white,
              strokeWidth: 4.0,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 110,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
