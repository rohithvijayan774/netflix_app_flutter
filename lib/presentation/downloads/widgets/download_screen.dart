import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final widgetList = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  // final List imageList = [
  //   "https://www.themoviedb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
  //   "https://www.themoviedb.org/t/p/original/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
  //   "https://www.themoviedb.org/t/p/original/kGgB1AiOogVfAmMokukr9kIJZCJ.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(const DownloadsEvent.getDownloadsImage());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    return Column(
      children: [
        Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style:
              GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          "We'll download a personalised selection of\n movies and shows for you, so there's\n always something to watch on your\n phone.",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontSize: 18, color: Colors.grey),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.35,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        DownloadImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 180, bottom: 20),
                          angle: 20,
                          size: Size(size.width * 0.30, size.width * 0.48),
                        ),
                        DownloadImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 180, bottom: 20),
                          angle: -20,
                          size: Size(size.width * 0.30, size.width * 0.48),
                        ),
                        DownloadImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(left: 0),
                          size: Size(size.width * 0.4, size.width * 0.58),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kBlueButton,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Set Up',
                style: GoogleFonts.montserrat(
                    color: kWhiteColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kWhiteButton,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'See what you can download',
              style: GoogleFonts.montserrat(
                  color: kBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        const Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: GoogleFonts.montserrat(),
        ),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageList))),
      ),
    );
  }
}
