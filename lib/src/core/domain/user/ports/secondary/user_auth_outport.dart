

abstract class IUserRegistryOutputPort {
  Future<void> registerUserOut(int userID, String email, String password);
}