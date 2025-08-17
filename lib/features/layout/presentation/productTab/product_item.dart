import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_states.dart';
import 'package:ecommerce/features/layout/presentation/favTab/cubit/favorite_cubit.dart';
import 'package:ecommerce/features/layout/presentation/favTab/cubit/favorite_states.dart';
import 'package:ecommerce/features/layout/presentation/productTab/screen/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  ProductEntity product;
  ProductItem({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product),));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white70,
          border: Border.all(color: Colors.indigo.shade800, width: 1.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                BlocBuilder<FavoritesCubit,FavoritesState>(
                  builder: (context, state) {
                    final cubit = context.read<FavoritesCubit>();
                    final isFavorite = cubit.isFavorite(product);
                    return Positioned(
                      right: 1,
                      top: 4,
                      child: Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            cubit.toggleFavorite(product);
                          },
                          icon: Icon(CupertinoIcons.heart_solid, color:isFavorite? AppColors.red :AppColors.gray,size: 20,),
                        ),
                      ),
                    ) ;
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                children: [
                  Text(
                    "EGP ${product.price}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            BlocBuilder<CartCubit,CartStates>(
                builder: (context, state) {
                  final cubit = context.read<CartCubit>();
                  final isInCart = cubit.isAddToCart(product);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review (${product.review}) ⭐",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              cubit.addToCart(product);
                            },
                            icon: Icon(Icons.add, color:isInCart? AppColors.blue :AppColors.gray,size: 20,),
                          ),
                        )
                      ],
                    ),
                  ) ;
                },
            ),
          ],
        ),
      ),
    );
  }
}
