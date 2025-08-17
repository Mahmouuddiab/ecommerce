import 'package:ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomRowBar extends StatelessWidget {
  String textOne;
  String textTwo;
  CustomRowBar({super.key,required this.textOne,required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textOne,style: TextStyle(
          fontSize: 19,fontWeight: FontWeight.bold,color: AppColors.primary
        ),),
        Text(textTwo,style: TextStyle(
            fontSize: 19,fontWeight: FontWeight.bold,color: AppColors.gray
        ),)
      ],
    );
  }
}
