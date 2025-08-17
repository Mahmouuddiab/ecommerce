import 'package:ecommerce/features/layout/presentation/favTab/screen/favorite_screen.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/screen/home_screen.dart';
import 'package:ecommerce/features/layout/presentation/layout_cubit/layout_states.dart';
import 'package:ecommerce/features/layout/presentation/productTab/screen/product_screen.dart';
import 'package:ecommerce/features/layout/presentation/profileTab/screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(LayoutInitialState());
  int currentIndex = 0;
  List<Widget> tabs = [HomeScreen(),ProductScreen(),FavoriteScreen(),ProfileScreen()];
  void changeBottomNavIndex(int selectedIndex){
    currentIndex = selectedIndex;
    emit(ChangeBottomNavIndex());
  }
}