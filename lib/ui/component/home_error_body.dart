import 'package:flutter/material.dart';

import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_mvvp_movie/provider/movie_future_provider.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key key,
    @required this.message,
  })  : assert(message != null, 'A non-null String must be provided'),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => context.refresh(moviesFutureProvider),
            child: Text("Try again"),
          ),
        ],
      ),
    );
  }
}
