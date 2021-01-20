import 'package:flutter/material.dart';
import 'package:riverpod_mvvp_movie/model/movie.dart';
import 'package:riverpod_mvvp_movie/ui/component/poster_movie_images.dart';

// get current user pushed movie info
// then display its poster

class PosterView extends StatelessWidget {
  final List<Movie> movies;

  const PosterView({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
        children:
            movies.map((movie) => PosterMovieImages(movie: movie)).toList(),
      ),
    );
  }
}
