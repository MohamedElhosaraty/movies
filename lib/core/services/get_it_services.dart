import 'package:get_it/get_it.dart';
import 'package:movies/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies/features/movies/data/repository/movie_repo_impl.dart';
import 'package:movies/features/movies/domain/repository/movies_repo.dart';
import 'package:movies/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/features/movies/domain/usecases/get_top_rated_movies.dart';
import '../../features/movies/presentation/controller/movies_bloc.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() async{
  getIt.registerSingleton<ApiService>(ApiService());

  //bloc
  getIt.registerFactory<MoviesBloc>(() => MoviesBloc(getIt(), getIt(), getIt()));

  // Data Source
  getIt.registerSingleton<BaseMovieRemoteDataSource>(
     MovieRemoteDataSource(getIt.get<ApiService>()));

  // Repository
  getIt.registerSingleton<MoviesRepo>(
      MovieRepoImpl( getIt.get<BaseMovieRemoteDataSource>()));

  // UseCases
  getIt.registerSingleton( GetNowPlayingMovies(getIt.get<MoviesRepo>()));
  getIt.registerSingleton( GetTopRatedMovies(getIt.get<MoviesRepo>()));
  getIt.registerSingleton( GetPopularMovies(getIt.get<MoviesRepo>()));

  // getIt.registerSingleton<UserRemoteDataSource>(
  //     UserRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));
  //
  // getIt.registerSingleton<UserRepository>(
  //     UserRepositoryImpl(remoteDataSource: getIt.get<UserRemoteDataSource>()));
  //
  // getIt.registerSingleton<LogoRemoteDataSource>(
  //   LogoRemoteDataSourceImpl(apiService: getIt.get<ApiService>())
  // );
  //
  // // 1. تهيئة Hive
  // await Hive.initFlutter();
  // Hive.registerAdapter(LogoModelHiveAdapter());
  // final taskBox = await Hive.openBox<LogoModelHive>('task_box'); // فتح الصندوق
  //
  // // 2. تسجيل `Hive Box`
  // getIt.registerLazySingleton<Box<LogoModelHive>>(() => taskBox);
  //
}
