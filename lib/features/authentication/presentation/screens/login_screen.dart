import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/dialogs/dialogs.dart';
import 'package:ecommerce/core/router/app_routes.dart';
import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/core/validators/validators.dart';
import 'package:ecommerce/core/widgets/app_button.dart';
import 'package:ecommerce/core/widgets/custom_field.dart';
import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:ecommerce/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool obscureText = true;

  var formKey=GlobalKey<FormState>();

  AuthCubit authCubit =getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        if(state is LoginLoadingState){
          DialogFunctions.showLoadingDialog(context, "Loading...");
        }
        if(state is LoginErrorState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: "error",
              posActionName: "ok",
              title: "login fail"
          );
        }
        if(state is LoginSuccessState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: "Success",
              posActionName: "ok",
              title: "login success"
          );
          Navigator.pushNamed(context, AppRoutes.layout);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  CustomText(
                    text: "To continue login with \n Your email",
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                  SizedBox(height: 30),
                  CustomField(
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your email",
                    obscureText: false,
                    filled: true,
                    controller: emailController,
                    validator: (p0) => AppValidators.emailValidator(emailController.text),
                    suffixIcon: Icon(Icons.alternate_email, color: AppColors.primary),
                  ),
                  CustomField(
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(obscureText? Icons.visibility_off:Icons.visibility,color: AppColors.primary,)
                    ),
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your password",
                    obscureText: obscureText,
                    filled: true,
                    controller: passwordController,
                    validator: (p0) => AppValidators.passwordValidator(passwordController.text),
                  ),
                  AppButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        authCubit.login(
                            emailController.text,
                            passwordController.text);
                      }
                    },
                    backgroundColor: AppColors.white,
                    child: CustomText(
                      text: "Login",
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "haven't an account?",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: CustomText(
                          text: "Create one",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
