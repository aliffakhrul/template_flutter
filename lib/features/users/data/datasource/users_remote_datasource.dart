import 'package:dio/dio.dart';
import 'package:mobile_projek/features/users/domain/model/user_model.dart';

class UsersRemoteDatasource {
  final Dio dio;

  UsersRemoteDatasource({required this.dio});

  Future<List<UserModel>> getUsers() async {
    var result = await dio.get('users');
    return (result.data['users'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
