import 'package:get_it/get_it.dart';
import 'package:mobile_projek/core/api/api_client.dart';
import 'package:mobile_projek/features/users/data/datasource/users_remote_datasource.dart';
import 'package:mobile_projek/features/users/data/repository/users_repository_implement.dart';
import 'package:mobile_projek/features/users/domain/repository/user_repository.dart';
import 'package:mobile_projek/features/users/presentations/bloc/users_bloc.dart';

var getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(ApiClient());
  getIt.registerSingleton(getIt<ApiClient>().getDio());
  getIt.registerLazySingleton(() => UsersRemoteDatasource(dio: getIt()));
  getIt.registerLazySingleton<UserRepository>(
    () => UsersRepositoryImplement(userRemoteDatasource: getIt()),
  );
  getIt.registerFactory(()=> UsersBloc(userRepository: getIt()));
}
