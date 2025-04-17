import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';
import 'package:movies/features/movies/domain/entities/movie_recommendation.dart';
import 'package:movies/features/movies/domain/entities/movies_entity.dart';
import 'package:movies/features/movies/domain/repository/movies_repo.dart';

class MovieRepoImpl extends MoviesRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepoImpl(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    final result =
        await baseMovieRemoteDataSource.getMovieDetails(movieId);
    try {
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendations(int movieId) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommendation(movieId);
    try {
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
