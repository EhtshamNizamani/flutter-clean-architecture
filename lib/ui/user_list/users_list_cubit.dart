
import 'package:clean_architecture/domain/repositories/user_repository.dart';
import 'package:clean_architecture/ui/user_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit( this.usersRepository) : super(UsersListState.empty());
final UsersRepository usersRepository;
  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true,error: null));
    final usersResponse = await usersRepository.fetchUser();
    usersResponse.fold((error){
      emit(state.copyWith(isLoading: false,error:error.error));
    }, (users){
    emit(state.copyWith(users: users, isLoading: false));
    });
  }
}
