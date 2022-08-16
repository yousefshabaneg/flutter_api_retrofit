import 'package:api_course/user.dart';
import 'package:api_course/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    final response = await webServices.getAllUsers();
    print(response[0].email);
    // return response.map((user) => User.fromJson(user.toJson())).toList();
    return response;
  }
}
