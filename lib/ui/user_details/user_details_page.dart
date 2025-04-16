import 'package:clean_architecture/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key,required this.user});
final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(children: [
        Text(user.name),
        Text(user.email)
      ],),),
    );
  }
}