
import 'package:clean_architecture/domain/entities/user.dart';
import 'package:clean_architecture/domain/repositories/user_repository.dart';
import 'package:clean_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:clean_architecture/ui/users_list/uesrs_list_navigator.dart';
import 'package:clean_architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit(this.usersRepository,this.navigator) : super(UsersListState.empty());
final UsersRepository usersRepository;
final UserListNavigator navigator;
  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true,error: null));
    final usersResponse = await usersRepository.fetchUser();
    usersResponse.fold((error){
      emit(state.copyWith(isLoading: false,error:error.error));
    }, (users){
    emit(state.copyWith(users: users, isLoading: false));
    });
  }

   onTapUser({required User user}) {
    navigator.openUserDetailsPage(UserDetailsInitialParams(user: user));
  }
}
