import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/features/movies/domain/entities/movies_entity.dart';
import 'package:movies/features/movies/domain/repository/movies_repo.dart';

class GetNowPlayingMovies {
  final MoviesRepo moviesRepo;

  GetNowPlayingMovies(this.moviesRepo);

  Future<Either<Failure, List<Movie>>> execute() async {

    return await moviesRepo.getNowPlayingMovies();
  }
}
