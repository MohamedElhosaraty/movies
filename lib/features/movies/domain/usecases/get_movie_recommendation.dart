import 'package:dartz/dartz.dart';
import 'package:movies/features/movies/domain/entities/movie_recommendation.dart';
import 'package:movies/features/movies/domain/repository/movies_repo.dart';

import '../../../../core/errors/failures.dart';

class GetMovieRecommendation {
  final MoviesRepo moviesRepo;

  GetMovieRecommendation(this.moviesRepo);

  Future<Either<Failure, List<MovieRecommendation>>> execute(int movieId) async {
    return await moviesRepo.getMovieRecommendations(movieId);
  }
}