import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/constants.dart';

class MainHomeCard extends StatelessWidget {
  const MainHomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 130,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: kBorderRadius15,
            color: Colors.black.withOpacity(0.1),
            image: const DecorationImage(
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/original/sv1xJUazXeYqALzczSZ3O6nkH75.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
