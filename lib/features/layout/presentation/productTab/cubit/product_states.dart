import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';

abstract class ProductStates{}

class ProductInitialState extends ProductStates {}

class ProductLoading extends ProductStates{}
class ProductLoaded extends ProductStates{
  final List<ProductEntity> products;
  ProductLoaded({required this.products});
}
class ProductError extends ProductStates{
  String error;
  ProductError(this.error);
}

