import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/features/movies/domain/usecases/get_top_rated_movies.dart';

import '../../../../core/utils/enum.dart';
import '../../domain/usecases/get_popular_movies.dart';
import 'movies_state.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetPopularMovies getPopularMovies;

  MoviesBloc(
      this.getNowPlayingMovies, this.getTopRatedMovies, this.getPopularMovies)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMovies.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: failure.message),
        ),
        (movies) => emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: movies,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMovies.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
              popularState: RequestState.error,
              popularMessage: failure.message),
        ),
        (movies) => emit(
          state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: movies,
          ),
        ),
      );
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMovies.execute();
      result.fold(
        (failure) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure.message)),
        (movies) => emit(
          state.copyWith(
              topRatedState: RequestState.loaded, topRatedMovies: movies),
        ),
      );
    });
  }
}
