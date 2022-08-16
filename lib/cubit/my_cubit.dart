import 'package:api_course/my_repo.dart';
import 'package:api_course/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(MyInitial());
  void emitGetAllUsers() {
    myRepo.getAllUsers().then((usersList) {
      emit(GetAllUsers(usersList));
    });
  }

  void emitGetUserDetails(int userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUserDetails(userDetails));
    });
  }

  void emitCreateNewUser(User newUser) {
    myRepo.createNewUser(newUser).then((newUser) {
      emit(CreateNewUser(newUser));
    });
  }
}
