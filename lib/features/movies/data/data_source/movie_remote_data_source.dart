import 'package:movies/core/errors/server_failure.dart';
import 'package:movies/core/services/api_service.dart';
import 'package:movies/core/utils/end_point.dart';
import 'package:movies/features/movies/data/models/movie_details_model.dart';
import 'package:movies/features/movies/data/models/movie_recommendation_model.dart';
import 'package:movies/features/movies/data/models/movies_model.dart';


abstract class BaseMovieRemoteDataSource {

  Future<List<MoviesModel>> getNowPlayingMovies() ;
  Future<List<MoviesModel>> getPopularMovies() ;
  Future<List<MoviesModel>> getTopRatedMovies() ;
  Future<MovieDetailsModel> getMovieDetails(int movieId) ;
  Future<List<MovieRecommendationModel>> getMovieRecommendation(int movieId) ;
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  final ApiService apiService;

  MovieRemoteDataSource(this.apiService);

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async{
    try {
      final response = await apiService.getRequest(EndPoint.nowPlayingMovies);

      final List<MoviesModel> movies = (response.data ["results"] as List<dynamic>)
          .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
          .toList() ;

      return movies;
    } on ServerFailure  {
      rethrow ;
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    try {
      final response = await apiService.getRequest(EndPoint.popularMovies);

      final List<MoviesModel> movies = (response.data ["results"] as List<dynamic>)
          .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
          .toList() ;

      return movies;
    } on ServerFailure  {
      rethrow ;
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    try {
      final response = await apiService.getRequest(EndPoint.topRatedMovies);

      final List<MoviesModel> movies = (response.data ["results"] as List<dynamic>)
          .map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
          .toList() ;

      return movies;
    } on ServerFailure  {
      rethrow ;
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    try {
      final response = await apiService.getRequest(EndPoint.movieDetails(movieId));

      return MovieDetailsModel.fromJson(response.data) ;
    } on ServerFailure  {
      rethrow ;
    }

  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendation(int movieId) async{
    try {
      final response = await apiService.getRequest(EndPoint.movieRecommendation(movieId));

      final List<MovieRecommendationModel> movies = (response.data ["results"] as List<dynamic>)
          .map((e) => MovieRecommendationModel.fromJson(e as Map<String, dynamic>))
          .toList() ;

      return movies;

    } on ServerFailure  {
      rethrow ;
    }

  }

}