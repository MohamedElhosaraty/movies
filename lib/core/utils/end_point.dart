class EndPoint {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static const String apiKey = 'feeefa6f089e37cf1ec249dc20f010e6';

  static const String nowPlayingMovies = 'movie/now_playing?api_key=$apiKey';

  static const String popularMovies = 'movie/popular?api_key=$apiKey';

  static const String topRatedMovies = 'movie/top_rated?api_key=$apiKey';
}
