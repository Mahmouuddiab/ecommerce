import 'package:ecommerce/features/layout/domain/entity/brand_entity.dart';
import 'package:ecommerce/features/layout/domain/entity/category_entity.dart';
import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';

abstract class HomeRepository{
  Future<List<CategoryEntity>> getCategories();
  Future<List<BrandEntity>> getBrands();
  Future<List<ProductEntity>> getProducts();
}