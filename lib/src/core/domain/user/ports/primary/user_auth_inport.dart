
// import '../../entities/user.dart';

abstract class IUserRegistryInputPort {
  Future<void> registerUserIn(int userID, String email, String password);
  // Future<void> registerUserInfo(IUserInfoRegistry user);
  // Future<void> loginUser(IUserLogin user);
}
