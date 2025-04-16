import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/features/movies/domain/entities/movies_entity.dart';
import 'package:movies/features/movies/domain/repository/movies_repo.dart';

class GetPopularMovies{

  final MoviesRepo moviesRepo;
  GetPopularMovies(this.moviesRepo);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await moviesRepo.getPopularMovies();
  }
}