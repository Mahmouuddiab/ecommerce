import 'package:ecommerce/features/layout/domain/entity/brand_entity.dart';
import 'package:ecommerce/features/layout/domain/entity/category_entity.dart';

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}

class HomeLoading extends HomeStates{}
class HomeLoaded extends HomeStates {
  final List<CategoryEntity> categories;
  final List<BrandEntity> brands;

  HomeLoaded({
    required this.categories,
    required this.brands,
  });
}
class HomeError extends HomeStates {
  final String message;
  HomeError(this.message);
}