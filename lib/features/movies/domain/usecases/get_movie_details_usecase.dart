import 'package:dartz/dartz.dart';
import 'package:movies/features/movies/domain/repository/movies_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_details.dart';

class GetMovieDetailsUsecase {

  final MoviesRepo moviesRepo;

  GetMovieDetailsUsecase(this.moviesRepo);

  Future<Either<Failure, MovieDetails>> execute(int movieId) async {
    return await moviesRepo.getMovieDetails(movieId);
  }

}