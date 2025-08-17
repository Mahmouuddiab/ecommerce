import 'package:ecommerce/features/layout/domain/entity/brand_entity.dart';
import 'package:ecommerce/features/layout/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase{
  HomeRepository homeRepository;
  GetBrandsUseCase(this.homeRepository);
  Future<List<BrandEntity>> call()=> homeRepository.getBrands();
}