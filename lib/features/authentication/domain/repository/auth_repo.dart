import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';

abstract class AuthRepository{

  Future<Either<ServerException,Unit>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone
      );
  Future<Either<ServerException,Unit>> login(String email, String password);
}