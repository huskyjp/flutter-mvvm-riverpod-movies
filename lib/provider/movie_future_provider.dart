// the provider will return list of movies
// 1. movieService: Get an instance
// 2. Access to the method which will return
import 'package:hooks_riverpod/all.dart';
import 'package:riverpod_mvvp_movie/model/movie.dart';

import 'movie_service_provider.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;
  // movieService has APIKey and dio
  final movieService = ref.watch(moviewServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});
