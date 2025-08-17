import 'package:ecommerce/features/layout/domain/usecase/GetBrandsUseCase.dart';
import 'package:ecommerce/features/layout/domain/usecase/GetCategoriesUseCase.dart';
import 'package:ecommerce/features/layout/presentation/homeTab/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetBrandsUseCase getBrandsUseCase;

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getBrandsUseCase,
  }) : super(HomeInitialState());

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final categories = await getCategoriesUseCase();
      final brands = await getBrandsUseCase();
      emit(HomeLoaded(categories: categories, brands: brands));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
