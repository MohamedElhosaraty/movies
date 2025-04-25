part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final RequestState movieDetailsState;
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;
  final List<MovieRecommendation>? movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieDetails,
    this.movieRecommendation,
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationMessage = '',
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    MovieDetails? movieDetails,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,
    List<MovieRecommendation>? movieRecommendation,
  }) {
    return MovieDetailsState(
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        movieDetails: movieDetails ?? this.movieDetails,
        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationMessage:
            movieRecommendationMessage ?? this.movieRecommendationMessage);
  }
}
