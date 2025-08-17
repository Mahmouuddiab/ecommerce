import 'package:ecommerce/features/layout/domain/usecase/GetProductsUseCase.dart';
import 'package:ecommerce/features/layout/presentation/productTab/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductStates>{
  GetProductsUseCase getProductsUseCase;
  ProductCubit(this.getProductsUseCase):super(ProductInitialState());
  Future<void> getProducts()async{
    emit(ProductLoading());
    try{
      final products = await getProductsUseCase.call();
      emit(ProductLoaded(products: products));
    }catch(e){
      emit(ProductError(e.toString()));
    }
  }
}