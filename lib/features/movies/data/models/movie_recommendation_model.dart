import 'package:movies/features/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  MovieRecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '/9eAn20y26wtB3aet7w9lHjuSgZ3.jpg',
    );
  }
}
