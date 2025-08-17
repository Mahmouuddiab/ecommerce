import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/features/authentication/data/dataSource/AuthRemoteDataSource.dart';
import 'package:ecommerce/features/authentication/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl ({required this.authRemoteDataSource});
  @override
  Future<Either<ServerException, Unit>> login(String email, String password)async{
    await authRemoteDataSource.login(email, password);
    return Right(unit);
  }

  @override
  Future<Either<ServerException, Unit>> register(String name, String email, String password, String rePassword, String phone)async{
    await authRemoteDataSource.register(name, email, password, rePassword, phone);
    return Right(unit);
  }

}
