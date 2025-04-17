import 'package:clean_architecture/domain/repositories/user_repository.dart';
import 'package:clean_architecture/navigator/app_navigator.dart';
import 'package:clean_architecture/ui/user_details/user_details_cubit.dart';
import 'package:clean_architecture/ui/users_list/uesrs_list_navigator.dart';
import 'package:clean_architecture/ui/users_list/users_list_cubit.dart';
import 'package:clean_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:clean_architecture/ui/users_list/users_list_page.dart';
import 'package:clean_architecture/data/rest_api_users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;
void main() async {
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository());
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UserListNavigator>(UserListNavigator(getIt()));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersListCubit(getIt(),getIt())..fetchUsers()),
        BlocProvider(create: (context) => UserDetailsCubit())
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
      home: UsersListPage(initialParams: UsersListInitialParams()),
    );
  }
}
