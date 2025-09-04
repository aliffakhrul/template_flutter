import 'package:dio/dio.dart';

class AuthRemoteDatasource {
  final Dio dio;
  AuthRemoteDatasource({required this.dio});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await dio.post(
      'auth/login',
      data: {
        "username": username,
        "password": password,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await dio.post(
      'https://reqres.in/api/register',
      data: {
        "email": email,
        "password": password,
      },
    );
    return response.data;
  }
}
