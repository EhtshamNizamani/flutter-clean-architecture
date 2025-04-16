import 'package:clean_architecture/domain/repositories/user_repository.dart';
import 'package:clean_architecture/ui/user_list/users_list_cubit.dart';
import 'package:clean_architecture/ui/user_list/users_list_page.dart';
import 'package:clean_architecture/data/rest_api_users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;
void main() async {
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersListCubit(getIt())..fetchUsers())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersListPage(),
    );
  }
}
