import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';

abstract class CartStates {}

class CartInitial extends CartStates {}

class CartLoaded extends CartStates {
  final List<ProductEntity> cartProducts;
  CartLoaded(this.cartProducts);
}