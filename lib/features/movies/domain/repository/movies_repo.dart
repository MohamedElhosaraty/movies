import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';
import 'package:movies/features/movies/domain/entities/movie_recommendation.dart';
import 'package:movies/features/movies/domain/entities/movies_entity.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);

  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendations(
      int movieId);
}
