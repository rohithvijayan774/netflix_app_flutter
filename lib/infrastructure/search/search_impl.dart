import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/downloads/core/api_end_points.dart';


@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final downloadsList = (response.data['results'] as List).map((e) {
        //   return SearchResp.fromJson(e);
        // }).toList();
        // print(downloadsList);
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
