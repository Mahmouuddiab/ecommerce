import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/widgets/cursor_slide_show.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_row_bar.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/cubit/home_cubit.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/cubit/home_states.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/widget/brand_item.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   HomeCubit homeCubit = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
        bloc: homeCubit..getHomeData(),
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      CustomAppBar(),
                      CursorSlideShow(),
                      CustomRowBar(textOne: "Categories", textTwo: "View All"),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) =>
                              CategoryItem(categoryEntity: state.categories[index]),
                          separatorBuilder: (_, __) => SizedBox(width: 10),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomRowBar(textOne: "Brands", textTwo: "View All"),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: state.brands.length,
                          itemBuilder: (context, index) =>
                              BrandItem(brandEntity: state.brands[index]),
                          separatorBuilder: (_, __) => SizedBox(width: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
    );
  }
}
