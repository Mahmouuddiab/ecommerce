import 'package:ecommerce/features/authentication/domain/usecases/login_usecase.dart';
import 'package:ecommerce/features/authentication/domain/usecases/register_usecase.dart';
import 'package:ecommerce/features/authentication/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthStates>{
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  AuthCubit(this.loginUseCase,this.registerUseCase):super(AuthInitialState());

  Future<void> login(String email,String password)async{
    emit(LoginLoadingState());
    var response= await loginUseCase.call(email, password);
    return response.fold(
          (l) {
        emit(LoginErrorState(l.message));
      },
          (r) {
        emit(LoginSuccessState());
      },
    ) ;
  }

  Future<void> register(String name,String email,String password,String rePassword,String phone)async{
    emit(RegisterLoadingState());
    var response =await registerUseCase.call(name, email, password, rePassword, phone);
    return response.fold(
          (l) {
        emit(RegisterErrorState(l.message));
      },
          (r) {
        emit(RegisterSuccessState());
      },
    ) ;
  }
}
