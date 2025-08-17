import 'package:ecommerce/features/authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce/features/authentication/presentation/screens/register_screen.dart';
import 'package:ecommerce/features/layout/presentation/cart/screen/cart_screen.dart';
import 'package:ecommerce/features/layout/presentation/favTab/screen/favorite_screen.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/screen/home_screen.dart';
import 'package:ecommerce/features/layout/presentation/layout/layout_screen.dart';
import 'package:ecommerce/features/layout/presentation/productTab/screen/product_details.dart';
import 'package:ecommerce/features/layout/presentation/productTab/screen/product_screen.dart';
import 'package:ecommerce/features/layout/presentation/profileTab/screen/profile_screen.dart';
import 'package:ecommerce/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => Login());
      case AppRoutes.layout:
        return MaterialPageRoute(builder: (_) => LayoutScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.product:
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case AppRoutes.favorite:
        return MaterialPageRoute(builder: (_) => FavoriteScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) =>  ProfileScreen()) ;
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) =>  CartScreen()) ;
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(body: Center(child: Text("Not Found"))),
        );
    }
  }
}
