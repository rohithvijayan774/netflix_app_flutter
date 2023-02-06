import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/search/models/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
