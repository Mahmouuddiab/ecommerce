import 'package:ecommerce/features/layout/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  CategoryEntity categoryEntity;
   CategoryItem({super.key,required this.categoryEntity});

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
            child: Image.network(categoryEntity.image)
        ),
        Text(categoryEntity.name,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),)
      ],
    );
  }
}
