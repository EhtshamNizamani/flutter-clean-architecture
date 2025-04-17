import 'package:clean_architecture/navigator/app_navigator.dart';
import 'package:clean_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:clean_architecture/ui/user_details/user_details_page.dart';
import 'package:flutter/material.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetailsPage(UserDetailsInitialParams initialParams) {
    navigator.push(context, UserDetailsPage(initialParams: initialParams));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
