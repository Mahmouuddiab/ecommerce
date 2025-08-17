import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/core/widgets/custom_bottom_item.dart';
import 'package:ecommerce/features/layout/presentation/layout_cubit/layout_cubit.dart';
import 'package:ecommerce/features/layout/presentation/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LayoutScreen extends StatelessWidget {
   LayoutScreen({super.key});
   LayoutCubit cubit =LayoutCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit,LayoutStates>(
      bloc: cubit,  
      builder: (context, state) => Scaffold(
        body: cubit.tabs[cubit.currentIndex],
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            ),
            child: BottomNavigationBar(
              onTap: (value) => cubit.changeBottomNavIndex(value),
              currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primary,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: AppColors.gray,
                iconSize: 27,
                items: [
                  CustomBottomItem(icon: Icon(Icons.home), label: "H"),
                  CustomBottomItem(icon: Icon(Icons.grid_view), label: "p"),
                  CustomBottomItem(icon: Icon(Icons.favorite_border), label: "F"),
                  CustomBottomItem(icon: Icon(Icons.person), label: "P")
                ]
            ),
          ),
        ),
    );
  }
}
