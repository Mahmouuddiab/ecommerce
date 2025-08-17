import 'package:ecommerce/features/layout/domain/entity/category_entity.dart';
import 'package:ecommerce/features/layout/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase{
  HomeRepository homeRepository;
  GetCategoriesUseCase(this.homeRepository);
  Future<List<CategoryEntity>> call()=> homeRepository.getCategories();
}