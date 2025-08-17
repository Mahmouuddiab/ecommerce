import 'package:ecommerce/core/router/app_router.dart';
import 'package:ecommerce/core/router/app_routes.dart';
import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/layout/presentation/favTab/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit(),),
        BlocProvider(create: (context) => CartCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.white
            )
          )
        ),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
