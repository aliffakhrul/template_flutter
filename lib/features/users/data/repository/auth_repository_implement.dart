import '../datasource/auth_remote_datasource.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImplement implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImplement({required this.remote});

  @override
  Future<Map<String, dynamic>> login(String username, String password) {
    return remote.login(username, password);
  }

  @override
  Future<Map<String, dynamic>> register(String email, String password) {
    return remote.register(email, password);
  }
}
