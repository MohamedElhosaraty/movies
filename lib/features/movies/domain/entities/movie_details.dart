import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genre> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runTime;

  const MovieDetails(
      {required this.backdropPath,
      required this.id,
      required this.genres,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.runTime});

  @override
  List<Object> get props => [
        backdropPath,
        id,
        genres,
        overview,
        releaseDate,
        title,
        voteAverage,
        runTime,
      ];
}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}
