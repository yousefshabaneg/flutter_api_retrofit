import 'package:api_course/user.dart';
import 'package:api_course/web_services.dart';
import 'package:retrofit/dio.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    return webServices.getAllUsers();
  }

  Future<User> getUserById(int userId) async {
    return webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser) async {
    return webServices.createNewUser(newUser, "Bearer $token");
  }

  Future<HttpResponse> deleteUser(int userId) async {
    return webServices.deleteUser(userId, "Bearer $token");
  }
}

const String token =
    "63923efe213777b4049559e7d1cee30b1f50adf8d1175f1a1798b54e6559d0d6";
