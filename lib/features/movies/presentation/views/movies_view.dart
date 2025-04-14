import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/get_it_services.dart';
import 'package:movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/features/movies/presentation/views/screen/movies_view_body.dart';


class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  static const routeName = 'movies';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const Scaffold(
        body: MoviesViewBody(),
      ),
    );
  }
}
