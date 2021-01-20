import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_mvvp_movie/model/movie.dart';

import '../../environment_config.dart';
import 'movies_exception_view.dart';

// This class method "getMoviews" will return a List<Movie>
// Viewに表示するための映画リストを取得するための準備
// 実際にAPIからデータを取ってくるのはModelから
class HomeViewModel extends ChangeNotifier {
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  HomeViewModel(this._environmentConfig, this._dio);

  // method to get list of movies from API
  Future<List<Movie>> getMovies() async {
    try {
      // HTTP Request to make GET request so we can simply pass API base URL with
      // API key then store it as a "response"
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );

      // HTTP Response: Read response body's result and store it as results
      final results = List<Map<String, dynamic>>.from(response.data['results']);

      // Get List of Movie from results which is a type of List<Map<String, dynamic>>
      // then return
      List<Movie> movies = results
          .map((singleMovie) => Movie.fromMap(singleMovie))
          .toList(growable: false);
      return movies;
      // show error message from movies_exception class
    } on DioError catch (dioError) {
      throw HomeExceptionView.fromDioError(dioError);
    }
  }
}
