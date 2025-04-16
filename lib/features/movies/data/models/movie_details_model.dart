import 'package:movies/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {
      required super.backdropPath,
      required super.id,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.runTime,
      });

  factory MovieDetailsModel.fromJson(Map<String,dynamic> json) => MovieDetailsModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      genres: List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
      overview: json["overview"],
      releaseDate: json["release_date"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
      runTime: json["runtime"],
  );
}

class GenreModel extends Genre {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String,dynamic> json) => GenreModel(
      id: json["id"],
      name: json["name"],
  );
}


