import 'package:ecommerce/core/router/app_routes.dart';
import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';
import 'package:ecommerce/features/layout/presentation/cart/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity product;
   ProductDetails({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25)
          )
        ),
        backgroundColor: AppColors.primary,
        leading: Icon(Icons.arrow_back_ios,size: 30,color: AppColors.white,),
        title: Text("Product Details",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.white
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Icon(CupertinoIcons.search,size: 30,color: AppColors.white,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(4),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey,width: 1.2)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 350,
                ),
              ),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.title,style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary
                ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text("EGP ${product.price}",style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary
                ),),
              ],
            ),
            SizedBox(height: 20,),
            Text("Description",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
              color: AppColors.primary
            )),
            Text(product.description,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 19,
                color: AppColors.textGray
            ),),
            SizedBox(height: 20,),
            Text("Colors",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: AppColors.primary
            ),),
            Row(
              spacing: 4,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.red
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellow
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blue
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              spacing: 25,
              children: [
                Text("Review",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: AppColors.primary
                ),),
                Text("${product.review}  ⭐",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary
                ),),
                
              ],
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                  },
                  child: Text("Add to cart",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white
                  ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.all(10)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
