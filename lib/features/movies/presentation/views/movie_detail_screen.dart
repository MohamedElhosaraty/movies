import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/features/movies/presentation/views/screen/movie_details_content.dart';

import '../../../../core/services/get_it_services.dart';
import '../../../../core/utils/dummy_details.dart';
import '../../../../core/utils/enum.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String routeName = 'movieDetail';
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecommendationEvent(id)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.movieDetailsState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return MovieDetailContent(
                  movie: state.movieDetails ?? movieDetailDummy,
                );
              case RequestState.error:
                return Text(state.movieDetailsMessage);
            }
          },
        ),
      ),
    );
  }
}

