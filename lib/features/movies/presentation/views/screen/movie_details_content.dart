import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';

import 'custom_sliver_app_bar.dart';
import 'custom_sliver_to_box.dart';
import 'custom_sliver_to_recommendation.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetails movie;

  const MovieDetailContent({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView2'),
      slivers: [
        CustomSliverAppBar(
          movie:  movie,),
        CustomSliverToBox(
          movie: movie,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'More like this'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
        const CustomSliverToRecommendation()
      ],
    );
  }

}
