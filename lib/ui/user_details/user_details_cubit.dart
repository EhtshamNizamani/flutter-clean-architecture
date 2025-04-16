import 'package:clean_architecture/domain/entities/user.dart';
import 'package:clean_architecture/ui/user_details/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsCubit extends Cubit<UserDetailsState>{
  UserDetailsCubit():super (UserDetailsState.initial());

 void  onInt(User user)=> emit(state.copyWith(user: user));

}