import 'package:clean_architecture/domain/entities/user.dart';
import 'package:clean_architecture/domain/failures/user_list_failure.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository{

Future<Either<UserListFailure,List<User>>> fetchUser();
}