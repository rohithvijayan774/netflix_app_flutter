import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

import '../../application/fast_laugh/fast_laugh_bloc.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const InitializeFastLaugh());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting data'),
            );
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: Text('VIdeo list empty'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videoList.length, (index) {
                return VideoListItemInheritedWIdget(
                    widget:
                        VideoListItem(key: Key(index.toString()), index: index),
                    movieData: state.videoList[index]);
              }),
            );
          }
        },
      )),
    );
  }
}
