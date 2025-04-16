import 'package:clean_architecture/domain/entities/user.dart';

class UserDetailsState {
  final User user;
  const UserDetailsState({required this.user});

  factory UserDetailsState.initial()=> UserDetailsState(user:User.empty());

  UserDetailsState copyWith({User? user})=> UserDetailsState(user: user?? this.user);
}