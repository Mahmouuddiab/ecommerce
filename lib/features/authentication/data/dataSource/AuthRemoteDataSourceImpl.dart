import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/dio_helper.dart';
import 'package:ecommerce/features/authentication/data/dataSource/AuthRemoteDataSource.dart';
import 'package:ecommerce/features/authentication/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Unit> login(String email, String password) async {
    final response= await DioHelper.postData(
        url: "https://ecommerce.routemisr.com/api/v1/auth/signin",
        data: {
          "email":email,
          "password":password
        }
    );
    final userResponse=UserModel.fromJson(response.data);
    return unit ;
  }

  @override
  Future<Unit> register(String name, String email, String password, String rePassword, String phone)async {
    final response= await DioHelper.postData(
        url: "https://ecommerce.routemisr.com/api/v1/auth/signup",
        data: {
          "name":name,
          "email":email,
          "password":password,
          "rePassword":rePassword,
          "phone":phone
        }
    );
    final userResponse=UserModel.fromJson(response.data);
    return unit;
  }

}