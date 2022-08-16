import 'package:api_course/cubit/my_cubit.dart';
import 'package:api_course/my_repo.dart';
import 'package:api_course/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGitIt() {
  // * Bloc
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));

  // * Data Sources

  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
    () => WebServices(Dio()),
  );
}

Dio createAndSetupDio() {
  final Dio dio = Dio();
  dio
    ..options.connectTimeout = 1 * 1000
    ..options.connectTimeout = 10 * 1000;

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
    ),
  );
  return dio;
}
