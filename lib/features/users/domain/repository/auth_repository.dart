abstract class AuthRepository {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<Map<String, dynamic>> register(String email, String password);
}
