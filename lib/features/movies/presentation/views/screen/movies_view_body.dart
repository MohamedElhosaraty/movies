import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_categories.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_popular_listview_image.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_slider.dart';
import 'package:movies/features/movies/presentation/views/screen/custom_top_rated_list_view_image.dart';

import '../../../../../core/utils/enum.dart';
import '../../controller/movies_state.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSliderAnimated(),
          BlocBuilder<MoviesBloc, MoviesState>(
            buildWhen: (previous, current) =>
                previous.popularState != current.popularState,
            builder: (context, state) {
              if (RequestState.loaded == state.popularState) {
                return CustomCategories(
                  title: "Popular",
                  movies: state.popularMovies,
                );
              }
              return const SizedBox();
            },
          ),
          const CustomPopularListviewImage(),
          BlocBuilder<MoviesBloc, MoviesState>(
            buildWhen: (previous, current) =>
                previous.topRatedState != current.topRatedState,
            builder: (context, state) {
              if (RequestState.loaded == state.topRatedState) {
                return CustomCategories(
                    movies: state.topRatedMovies, title: "Top Rated");
              }

              return const SizedBox();
            },
          ),
          const CustomTopRatedListViewImage(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
