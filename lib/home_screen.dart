import 'package:api_course/cubit/my_cubit.dart';
import 'package:api_course/cubit/result_state.dart';
import 'package:api_course/network_exceptions.dart';
import 'package:api_course/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    // BlocProvider.of<MyCubit>(context).emitGetUserDetails(200);
    BlocProvider.of<MyCubit>(context).emitCreateNewUser(
      User(
        name: "Yousef Shaban",
        email: "yousef.eg@gmasil.com",
        gender: "male",
        status: 'active',
      ),
    );
    // BlocProvider.of<MyCubit>(context).emitDeleteUser(2937);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          buildGetUserDetails(),
        ],
      ),
    );
  }

  Widget buildGetUserDetails() {
    return BlocBuilder<MyCubit, ResultState<dynamic>>(
      builder: (context, ResultState<dynamic> state) {
        return state.when(
          idle: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (dynamic userData) {
            final user = userData as User;
            return Container(
              height: 50,
              color: Colors.amber,
              child: Center(
                child: Text(user.email ?? ''),
              ),
            );
          },
          error: (networkExceptions) => Center(
            child: Text(NetworkExceptions.getErrorMessage(networkExceptions)),
          ),
        );
        // if (state is DeleteUser) {
        //   // user = state.newUser;
        //   return Container(
        //     height: 50,
        //     color: Colors.amber,
        //     child: Center(
        //       child: Text(state.data.response.statusCode.toString()),
        //     ),
        //   );
        // }
        // if (state is ResultState) {
        //   user = state.newUser;
        //   return Container(
        //     height: 50,
        //     color: Colors.amber,
        //     child: Center(
        //       child: Text(user.email ?? ''),
        //     ),
        //   );
        // }
        // if (state is GetUserDetails) {
        //   user = state.userDetails;
        //   return Container(
        //     height: 50,
        //     color: Colors.amber,
        //     child: Center(
        //       child: Text(user.email ?? ''),
        //     ),
        //   );
        // }
        // if (state is GetAllUsers) {
        //   usersList = state.users;
        //   return ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: usersList.length,
        //     itemBuilder: (context, index) => Container(
        //       height: 50,
        //       color: Colors.amber,
        //       child: Center(
        //         child: Text(usersList[index].email ?? ''),
        //       ),
        //     ),
        //   );
        // }
      },
    );
  }
}
