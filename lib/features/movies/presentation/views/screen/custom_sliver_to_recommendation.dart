import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/domain/entities/movie_recommendation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/dummy_details.dart';
import '../../../../../core/utils/end_point.dart';
import '../../../../../core/utils/enum.dart';
import '../../controller/movie_details_bloc.dart';

class CustomSliverToRecommendation extends StatelessWidget {
  const CustomSliverToRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {

        switch (state.movieRecommendationState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: _showRecommendations(state.movieRecommendation ?? recommendationDummy),
            );
          case RequestState.error:
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.movieDetailsMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
        }
      },
    );
  }

  Widget _showRecommendations( List<MovieRecommendation> recommendations) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final recommendation = recommendations[index];
          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              child: CachedNetworkImage(
                imageUrl: EndPoint.imageUrl(recommendation.backdropPath!),
                placeholder: (context, url) =>
                    Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: recommendations.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }

}
