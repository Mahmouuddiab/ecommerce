import 'package:ecommerce/core/router/app_routes.dart';
import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary,width: 1.5),
                    borderRadius: BorderRadius.circular(25)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary,width: 1.5),
                    borderRadius: BorderRadius.circular(25)
                ),
                hintText: "what do you search for?",
                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary),
                prefixIcon: Icon(CupertinoIcons.search,size: 30,color: AppColors.primary,)
            ),
          ),
        ),
        BlocBuilder<CartCubit,CartStates>(
            builder: (context, state) {
              if(state is CartLoaded){
                return Badge(
                  backgroundColor: AppColors.red,
                  alignment: Alignment.topCenter,
                  label: Text("${state.cartProducts.length}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),),
                  child: IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, AppRoutes.cart);
                      },
                      icon: Icon(Icons.shopping_cart_sharp,size: 30,color: AppColors.primary,)
                  ),
                ) ;
              }
              return SizedBox() ;
            },
        )
      ],
    );
  }
}
