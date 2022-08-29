import 'package:api_course/api_result.dart';
import 'package:api_course/network_exceptions.dart';
import 'package:api_course/user.dart';
import 'package:api_course/web_services.dart';
import 'package:retrofit/dio.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      final response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> getUserById(int userId) async {
    try {
      final response = await webServices.getUserById(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      final response =
          await webServices.createNewUser(newUser, "Bearer $token");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<HttpResponse>> deleteUser(int userId) async {
    try {
      final response = await webServices.deleteUser(userId, "Bearer $token");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}

const String token =
    "63923efe213777b4049559e7d1cee30b1f50adf8d1175f1a1798b54e6559d0d6";
