import '../Models/UserModel.dart';

abstract class DatabaseBase {
  Future<bool> saveUser(UserModel user);
  Future<UserModel> getUser(String userID);
}
