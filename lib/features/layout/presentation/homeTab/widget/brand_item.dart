import 'package:ecommerce/features/layout/domain/entity/brand_entity.dart';
import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget{
  BrandEntity brandEntity;
  BrandItem({super.key,required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(brandEntity.image)
        ),
        Text(brandEntity.name,style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 17
        ),)
      ],
    );
  }
}
