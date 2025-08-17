import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';
import 'package:ecommerce/features/layout/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase{
  HomeRepository homeRepository;
  GetProductsUseCase(this.homeRepository);
  Future<List<ProductEntity>> call()=> homeRepository.getProducts();
}