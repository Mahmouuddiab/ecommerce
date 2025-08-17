import 'dart:convert';
import 'package:ecommerce/core/api/dio_helper.dart';
import 'package:ecommerce/features/layout/data/dataSource/home_remote_ds.dart';
import 'package:ecommerce/features/layout/data/models/ProductModel.dart';
import 'package:ecommerce/features/layout/data/models/brand_model.dart';
import 'package:ecommerce/features/layout/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDS)
class HomeRemoteDSImpl implements HomeRemoteDS{
  @override
  Future<List<CategoryModel>> getCategories()async{
    final response = await DioHelper.getData(url: "https://ecommerce.routemisr.com/api/v1/categories");
    if(response.statusCode == 200){
      final List data = response.data['data'];
      return data.map((json)=>CategoryModel.fromJson(json)).toList() ;
    }
    else{
      throw Exception(response.data);
    }
  }

  @override
  Future<List<BrandModel>> getBrands()async{
    final response = await DioHelper.getData(url: "https://ecommerce.routemisr.com/api/v1/brands");
    if(response.statusCode==200){
      final List data = response.data['data'];
      return data.map((json)=>BrandModel.fromJson(json)).toList() ;
    }
    else{
      throw Exception(response.data);
    }
  }

  @override
  Future<List<ProductModel>> getProducts()async{
    final response = await DioHelper.getData(url: "https://ecommerce.routemisr.com/api/v1/products");
    if(response.statusCode==200){
      final List data = response.data['data'];
      return data.map((json)=>ProductModel.fromJson(json)).toList() ;
    }
    else{
      throw Exception(response.data);
    }
  }

}