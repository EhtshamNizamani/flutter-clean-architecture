import 'package:clean_architecture/ui/user_details/user_details_page.dart';
import 'package:clean_architecture/ui/user_list/users_list_cubit.dart';
import 'package:clean_architecture/ui/user_list/users_list_state.dart';
import 'package:clean_architecture/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<UsersListCubit>(context),
          builder: (context, state) {
            final userState = state as UsersListState;
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                
                    children: userState.users.map((user) => UserCard(user: user,onTap:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserDetailsPage(user: user))))).toList(),
                  );
          },
        ),
      ),
    );
  }
}
