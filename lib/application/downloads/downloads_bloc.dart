import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadRepo downloadRepo;
  DownloadsBloc(this.downloadRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccess: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await downloadRepo.getDownloadsImage();
      log(downloadsOption.toString());
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccess: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrSuccess: Some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}
