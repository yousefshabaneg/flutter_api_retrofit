import 'package:api_course/cubit/result_state.dart';
import 'package:api_course/my_repo.dart';
import 'package:api_course/network_exceptions.dart';
import 'package:api_course/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';

class MyCubit extends Cubit<ResultState<dynamic>> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(const Idle());
  Future<void> emitGetAllUsers() async {
    final result = await myRepo.getAllUsers();

    result.when(
      success: (List<User> allUsers) {
        emit(ResultState.success(allUsers));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ResultState.error(networkExceptions));
      },
    );
  }

  Future<void> emitGetUserDetails(int userId) async {
    final result = await myRepo.getUserById(userId);

    result.when(
      success: (User user) => emit(ResultState.success(user)),
      failure: (NetworkExceptions networkExceptions) =>
          emit(ResultState.error(networkExceptions)),
    );
  }

  Future<void> emitCreateNewUser(User newUser) async {
    final result = await myRepo.createNewUser(newUser);

    result.when(
      success: (User userData) {
        emit(ResultState.success(userData));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ResultState.error(networkExceptions));
      },
    );
  }

  Future<void> emitDeleteUser(int userId) async {
    final result = await myRepo.deleteUser(userId);
    result.when(
      success: (HttpResponse response) => emit(ResultState.success(response)),
      failure: (NetworkExceptions networkExceptions) =>
          emit(ResultState.error(networkExceptions)),
    );
  }
}
