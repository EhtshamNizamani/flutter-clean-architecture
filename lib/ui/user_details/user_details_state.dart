import 'package:clean_architecture/domain/entities/user.dart';
import 'package:clean_architecture/ui/user_details/user_details_initial_params.dart';

class UserDetailsState {
  final User user;
  const UserDetailsState({required this.user});

  factory UserDetailsState.initial(UserDetailsInitialParams initialParams)=> UserDetailsState(user:initialParams.user);

  UserDetailsState copyWith({User? user})=> UserDetailsState(user: user?? this.user);
}