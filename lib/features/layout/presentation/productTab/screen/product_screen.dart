import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/layout/presentation/productTab/cubit/product_cubit.dart';
import 'package:ecommerce/features/layout/presentation/productTab/cubit/product_states.dart';
import 'package:ecommerce/features/layout/presentation/productTab/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  ProductCubit productCubit = getIt<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductStates>(
        bloc: productCubit..getProducts(),
        builder: (context, state) {
          if(state is ProductLoading){
            return Center(child: CircularProgressIndicator(),) ;
          }
          if(state is ProductLoaded){
            return SafeArea(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.83
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product= state.products[index];
                  return ProductItem(product: product) ;
                },
              ),
            ) ;
          }
          if(state is ProductError){
            return Center(child: Text(state.error),) ;
          }
          return SizedBox() ;
        },
    );
  }
}
