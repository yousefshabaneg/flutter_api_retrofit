import 'package:api_course/cubit/my_cubit.dart';
import 'package:api_course/home_screen.dart';
import 'package:api_course/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGitIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}
