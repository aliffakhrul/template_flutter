import 'package:mobile_projek/features/users/domain/model/user_model.dart';

abstract class UserRepository{
  Future<List<UserModel>> getUsers();
}