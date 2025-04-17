import 'package:clean_architecture/navigator/app_navigator.dart';
import 'package:clean_architecture/ui/user_details/user_details_navigator.dart';
import 'package:clean_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:clean_architecture/ui/users_list/users_list_page.dart';
import 'package:flutter/material.dart';

class UserListNavigator with UserDetailsRoute {
  UserListNavigator(this.navigator);
  @override
  late BuildContext context;
  @override
  late AppNavigator navigator;
}

mixin UserListRoute {
  openUsersListPage(UsersListInitialParams initialParams) {
    navigator.push(context, UsersListPage(initialParams: initialParams));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
