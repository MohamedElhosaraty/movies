import 'package:get_it/get_it.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() async{
  getIt.registerSingleton<ApiService>(ApiService());
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
