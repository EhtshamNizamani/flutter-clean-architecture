import 'package:clean_architecture/ui/user_details/user_details_cubit.dart';
import 'package:clean_architecture/ui/user_details/user_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key,required this.userDetailsCubit});
final UserDetailsCubit userDetailsCubit;

  UserDetailsCubit get cubit => userDetailsCubit ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
        bloc:cubit,
        builder: (context,state) {
          state as UserDetailsState;
          return Center(child: Column(children: [
            Text(state.user.name),
            Text(state.user.email)
          ],),);
        }
      ),
    );
  }
}