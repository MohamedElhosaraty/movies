
import 'package:flutter/material.dart';
import 'package:movies/features/movies/presentation/views/movies_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case MoviesView.routeName:
      return MaterialPageRoute(builder: (_) => const MoviesView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
