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

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  var phoneController = TextEditingController();

  bool obscureText = true;

  var formKey=GlobalKey<FormState>();

  AuthCubit authCubit =getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          DialogFunctions.showLoadingDialog(context, "Loading...");
        }
        if(state is RegisterErrorState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: state.error,
              posActionName: "ok",
              title: "Register Fail"
          );
        }
        if(state is RegisterSuccessState){
          DialogFunctions.hideLoading(context);
          DialogFunctions.showMessageDialog(context: context,
              message: "success",
              posActionName: "ok",title: "Success Register");
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
                spacing: 25,
                children: [
                  SizedBox(height: 5),
                  CustomText(
                    text: "To create an account \n Complete your data",
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  SizedBox(height: 20),
                  CustomField(
                    suffixIcon: Icon(Icons.person,color: AppColors.primary,),
                    keyboardType: TextInputType.text,
                    hint: "Enter your name",
                    obscureText: false,
                    filled: true,
                    controller: nameController,
                    validator: (p0) => AppValidators.displayNameValidator(nameController.text),
                  ),
                  CustomField(
                    suffixIcon: Icon(Icons.alternate_email,color: AppColors.primary,),
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your email",
                    obscureText: false,
                    filled: true,
                    controller: emailController,
                    validator: (p0) => AppValidators.emailValidator(emailController.text),
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
                    keyboardType: TextInputType.number,
                    hint: "Enter your password",
                    obscureText: obscureText,
                    filled: true,
                    controller: passwordController,
                    validator: (p0) => AppValidators.passwordValidator(passwordController.text),
                  ),
                  CustomField(
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(obscureText?
                        Icons.visibility_off:Icons.visibility,color: AppColors.primary,)
                    ),
                    keyboardType: TextInputType.number,
                    hint: "Confirm password",
                    obscureText: obscureText,
                    filled: true,
                    controller: rePasswordController,
                    validator: (p0) => AppValidators.repeatPasswordValidator(password: passwordController.text, value:rePasswordController.text ),
                  ),
                  CustomField(
                    suffixIcon: Icon(Icons.phone,color: AppColors.primary,),
                    keyboardType: TextInputType.phone,
                    hint: "Enter your phone number",
                    obscureText: false,
                    filled: true,
                    controller: phoneController,
                    validator: (p0) => AppValidators.phoneValidator(phoneController.text, context),
                  ),
                  SizedBox(height: 15),
                  AppButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        authCubit.register(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            rePasswordController.text,
                            phoneController.text);
                      }
                    },
                    backgroundColor: AppColors.white,
                    child: CustomText(
                      text: "Sign Up",
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "have an account?",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: CustomText(
                          text: "Login",
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
