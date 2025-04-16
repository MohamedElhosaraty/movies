import 'package:movies/features/movies/domain/entities/movies_entity.dart';

class MoviesModel extends Movie {
  const MoviesModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      backdropPath: json["backdrop_path"] as String? ?? "",
      genreIds: (json["genre_ids"] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],
      id: json["id"] as int? ?? 0,
      overview: json["overview"] as String? ?? "No overview available.",
      releaseDate: json["release_date"] as String? ?? "Unknown",
      title: json["title"] as String? ?? "Untitled",
      voteAverage: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
    );
  }
}
