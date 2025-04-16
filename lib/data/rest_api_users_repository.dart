import 'dart:convert';

import 'package:clean_architecture/domain/entities/user.dart';
import 'package:clean_architecture/data/user_json.dart';
import 'package:clean_architecture/domain/failures/user_list_failure.dart';
import 'package:clean_architecture/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class RestApiUsersRepository implements UsersRepository {
  @override
  Future<Either<UserListFailure, List<User>>> fetchUser() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      var list = jsonDecode(response.body) as List;
      final users = list.map((e) => UserJson.fromJson(e).toDomain()).toList();

      return right(users);
    } catch (error) {
      return left(UserListFailure(error: error.toString()));
    }
  }
}
