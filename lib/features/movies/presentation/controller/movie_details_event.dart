part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  GetMovieDetailsEvent(this.id);
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;
  GetMovieRecommendationEvent(this.id);
}