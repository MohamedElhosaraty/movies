import 'package:flutter/material.dart';
import 'package:movies/features/movies/presentation/views/screen/movies_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  static const routeName = 'movies';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesViewBody(),
    );
  }
}
