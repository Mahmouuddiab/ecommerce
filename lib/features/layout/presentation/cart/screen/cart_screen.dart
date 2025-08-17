import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
        builder: (context, state) {
          if(state is CartInitial){
            return Center(child: Text("cart is empty"),) ;
          }
          if(state is CartLoaded){
            return Scaffold(
              appBar: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)
                  )
                ),
                title: Text("Cart Screen",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
                ),),
                centerTitle: true,
                backgroundColor: AppColors.primary,
              ),
              body: ListView.builder(
                  itemCount: state.cartProducts.length,
                  itemBuilder: (context, index) {
                    final product= state.cartProducts[index];
                    return ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing: IconButton(
                          onPressed: (){
                            context.read<CartCubit>().addToCart(product);
                          }, 
                          icon: Icon(Icons.delete,color: AppColors.red,)
                      ),
                    ) ;
                  },
              ),
            ) ;
          }

          return SizedBox() ;
        },
    );
  }
}
