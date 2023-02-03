import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/downloads/widgets/download_screen.dart';
import 'package:netflix_clone/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_clone/presentation/home/home_screen.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_navigation.dart';
import 'package:netflix_clone/presentation/new_and_hot/new_and_hot_screen.dart';
import 'package:netflix_clone/presentation/search/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final pages = [
    HomeScreen(),
    NewAndHotScreen(),
    FastLaughScreen(),
    SearchScreen(),
    DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
