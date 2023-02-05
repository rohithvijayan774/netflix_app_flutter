import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_homePage_button.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget_two.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: Text(
              'New & Hot',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kwidth,
              Container(
                color: Colors.blue,
                width: 30,
                height: 30,
              ),
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: kWhiteColor,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                labelColor: kBlackColor,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                    color: kWhiteColor, borderRadius: kBorderRadius30),
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          buildComingSoon(),
          buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
    );
  }

  Widget buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) =>
          const EveryonesWatchingWidget(),
    );
  }
}
