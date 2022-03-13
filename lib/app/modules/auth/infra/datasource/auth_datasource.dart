abstract class AuthDatasource {
  Future<String> getAccessLevel(String user);
  Future<Map<String, dynamic>> login(String user, String password);
}
