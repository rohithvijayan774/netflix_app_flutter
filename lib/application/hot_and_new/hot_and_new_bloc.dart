import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotandNewService _hotandNewService;
  HotAndNewBloc(this._hotandNewService) : super(HotAndNewState.initial()) {
    /*
    get hot and new movie data
     */
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui

      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

      //data to state
      final _result = await _hotandNewService.getHotAndNewMovieData();

      //data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });

/*
    get hot and new tv data
     */
    on<LoadDataInEVeryoneIsWatching>((event, emit) {});
  }
}
