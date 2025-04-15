
import 'package:flutter/material.dart';
import 'package:movies/features/movies/presentation/views/movie_detail_screen.dart';
import 'package:movies/features/movies/presentation/views/movies_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case MoviesView.routeName:
      return MaterialPageRoute(builder: (_) => const MoviesView());

 case MovieDetailScreen.routeName:
      return MaterialPageRoute(builder: (_) =>  MovieDetailScreen(id: settings.arguments as int,));

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
