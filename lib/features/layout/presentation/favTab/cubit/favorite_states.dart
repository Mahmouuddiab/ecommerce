
import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<ProductEntity> favoriteProducts;

  FavoritesLoaded(this.favoriteProducts);
}