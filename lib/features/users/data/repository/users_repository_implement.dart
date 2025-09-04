import 'package:mobile_projek/features/users/data/datasource/users_remote_datasource.dart';
import 'package:mobile_projek/features/users/domain/model/user_model.dart';
import 'package:mobile_projek/features/users/domain/repository/user_repository.dart';

class UsersRepositoryImplement implements UserRepository {
  final UsersRemoteDatasource userRemoteDatasource;

  UsersRepositoryImplement({required this.userRemoteDatasource});

  @override
  Future<List<UserModel>> getUsers() async {
    return await userRemoteDatasource.getUsers();
  }
}
