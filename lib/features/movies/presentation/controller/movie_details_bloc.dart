import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enum.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';
import 'package:movies/features/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../domain/entities/movie_recommendation.dart';
import '../../domain/usecases/get_movie_recommendation.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieRecommendation getMovieRecommendationUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getMovieRecommendationUsecase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {

    final result = await getMovieDetailsUsecase.execute(event.id);

    result.fold((failure) => emit(state.copyWith(
        movieDetailsState: RequestState.error, movieDetailsMessage: failure.message)),
            (movieDetails) => emit(state.copyWith(
        movieDetailsState: RequestState.loaded, movieDetails: movieDetails)));
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{

    final result = await getMovieRecommendationUsecase.execute(event.id);

    result.fold((failure) => emit(state.copyWith(
        movieRecommendationState: RequestState.error, movieRecommendationMessage: failure.message)),
            (movieRecommendation) => emit(state.copyWith(
        movieRecommendationState: RequestState.loaded, movieRecommendation: movieRecommendation)));
  }
}
