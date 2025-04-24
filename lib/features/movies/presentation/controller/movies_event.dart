part of 'movies_bloc.dart';

sealed class MoviesEvent {}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}
