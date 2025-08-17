import 'package:ecommerce/features/layout/data/models/ProductModel.dart';
import 'package:ecommerce/features/layout/data/models/brand_model.dart';
import 'package:ecommerce/features/layout/data/models/category_model.dart';

abstract class HomeRemoteDS{
  Future<List<CategoryModel>> getCategories();
  Future<List<BrandModel>> getBrands();
  Future<List<ProductModel>> getProducts();
}