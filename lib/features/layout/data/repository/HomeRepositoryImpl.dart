import 'package:ecommerce/features/layout/data/dataSource/home_remote_ds.dart';
import 'package:ecommerce/features/layout/domain/entity/brand_entity.dart';
import 'package:ecommerce/features/layout/domain/entity/category_entity.dart';
import 'package:ecommerce/features/layout/domain/entity/product_entity.dart';
import 'package:ecommerce/features/layout/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository{
  HomeRemoteDS homeRemoteDS;
  HomeRepositoryImpl(this.homeRemoteDS);
  @override
  Future<List<CategoryEntity>> getCategories()async{
    final model = await homeRemoteDS.getCategories();
    return model.map((e)=>CategoryEntity(id: e.id, name: e.name, image: e.image)).toList() ;
  }

  @override
  Future<List<BrandEntity>> getBrands()async{
    final model = await homeRemoteDS.getBrands();
    return model.map((e)=>BrandEntity(id: e.id, name: e.name, image: e.image)).toList() ;
  }

  @override
  Future<List<ProductEntity>> getProducts()async{
    final model = await homeRemoteDS.getProducts();
    return model.map((e)=>ProductEntity(id: e.id!, title: e.title!, description: e.description!,
        price: e.price!, review: e.ratingsAverage, image: e.imageCover!)).toList() ;
  }

}