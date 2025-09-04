import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'features/users/presentations/bloc/auth/auth_bloc.dart';
import 'features/users/presentations/pages/login_page.dart';

void main() {
  final dio = Dio();

  runApp(
    BlocProvider(
      create: (_) => AuthBloc(dio),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      home: LoginPage(),
    );
  }
}
