import 'package:clean_architecture/ui/user_details/user_details_cubit.dart';
import 'package:clean_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:clean_architecture/ui/user_details/user_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key,required this.initialParams});
final UserDetailsInitialParams initialParams;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late UserDetailsCubit cubit ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  cubit =  BlocProvider.of<UserDetailsCubit>(context);
cubit.onInt(widget.initialParams);
  }
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