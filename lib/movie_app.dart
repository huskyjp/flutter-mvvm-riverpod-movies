import 'package:flutter/material.dart';

import 'ui/home/home_view.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moview App with Riverpod Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomeView(),
    );
  }
}
