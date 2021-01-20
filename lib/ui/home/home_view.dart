import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:riverpod_mvvp_movie/provider/movie_future_provider.dart';
import 'package:riverpod_mvvp_movie/ui/component/home_error_body.dart';
import 'package:riverpod_mvvp_movie/ui/component/home_movie_box.dart';
import 'package:riverpod_mvvp_movie/ui/poster/poster_view.dart';

import 'movies_exception_view.dart';

// ConsumerWidget only rebuild "watch" components: so we can simply pass
// watch(myProvider), then we construct UI
// This tiem we use HookWidget: we can simply first declare
// ex. final movieLists = useProvider(moviesFutureProvider) then same logic
class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = useProvider(moviesFutureProvider);
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Riverpod Recommended Movies'),
        ),
        body: moviesProvider.when(
          error: (e, s) {
            if (e is HomeExceptionView) {
              return ErrorBody(message: e.message);
            }
            return ErrorBody(
                message: "Sorry, something went wrong PLS TRY AGAIN!");
          },
          // just show circular progress indicatior when loading
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          // when data comes...
          data: (movies) {
            return RefreshIndicator(
              onRefresh: () {
                // force riverpod to rebuild the data when suer refresh the page
                return context.refresh(moviesFutureProvider);
              },

              // actual UI
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PosterView(movies: movies),
                    ),
                  );
                },
                child: GridView.extent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                  children:
                      movies.map((movie) => MovieBox(movie: movie)).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
