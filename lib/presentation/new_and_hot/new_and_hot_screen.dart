import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
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
          const ComingSoonList(
            key: Key('coming_soon'),
          ),
          buildEveryonesWatching(),
        ]),
      ),
    );
  }

  // Widget buildComingSoon() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
  //   );
  // }

  Widget buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => SizedBox(),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text(
              'Error while loading coming soon data',
            ),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text(
              'Coming soon list is empty',
            ),
          );
        } else {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                print(movie.releaseDate);

                final _date = DateTime.parse(movie.releaseDate!);
                final formattedDate = DateFormat.yMMMd('en_US').format(_date);
                print(formattedDate);
                // DateFormat.yMMMMd('en-US').format(date)

                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: formattedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase(),
                    day: '11',
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No description');
              });
        }
      },
    );
  }
}
