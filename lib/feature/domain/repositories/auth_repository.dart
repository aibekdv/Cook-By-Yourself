abstract class AuthRepository {
  Future<void> loggedIn(user);
  Future<void> loggedOut(user);
}
