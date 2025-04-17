import 'package:clean_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:clean_architecture/ui/user_details/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsCubit extends Cubit<UserDetailsState>{
  UserDetailsCubit(this.initialParams):super (UserDetailsState.initial(initialParams));
final UserDetailsInitialParams initialParams;

}