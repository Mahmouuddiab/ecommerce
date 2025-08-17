// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/authentication/data/dataSource/AuthRemoteDataSource.dart'
    as _i654;
import '../../features/authentication/data/dataSource/AuthRemoteDataSourceImpl.dart'
    as _i240;
import '../../features/authentication/data/repository/auth_repo_impl.dart'
    as _i205;
import '../../features/authentication/domain/repository/auth_repo.dart'
    as _i432;
import '../../features/authentication/domain/usecases/login_usecase.dart'
    as _i995;
import '../../features/authentication/domain/usecases/register_usecase.dart'
    as _i257;
import '../../features/authentication/presentation/cubit/auth_cubit.dart'
    as _i678;
import '../../features/layout/data/dataSource/home_remote_ds.dart' as _i1025;
import '../../features/layout/data/dataSource/home_remote_ds_impl.dart'
    as _i675;
import '../../features/layout/data/repository/HomeRepositoryImpl.dart' as _i729;
import '../../features/layout/domain/repository/home_repository.dart' as _i31;
import '../../features/layout/domain/usecase/GetBrandsUseCase.dart' as _i228;
import '../../features/layout/domain/usecase/GetCategoriesUseCase.dart'
    as _i641;
import '../../features/layout/domain/usecase/GetProductsUseCase.dart' as _i115;
import '../../features/layout/presentation/homeTab/cubit/home_cubit.dart'
    as _i812;
import '../../features/layout/presentation/productTab/cubit/product_cubit.dart'
    as _i523;
import '../api/dio_helper.dart' as _i646;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i646.DioHelper>(() => _i646.DioHelper.new());
    gh.factory<_i1025.HomeRemoteDS>(() => _i675.HomeRemoteDSImpl());
    gh.factory<_i654.AuthRemoteDataSource>(
      () => _i240.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i432.AuthRepository>(
      () => _i205.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i654.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i31.HomeRepository>(
      () => _i729.HomeRepositoryImpl(gh<_i1025.HomeRemoteDS>()),
    );
    gh.factory<_i995.LoginUseCase>(
      () => _i995.LoginUseCase(authRepository: gh<_i432.AuthRepository>()),
    );
    gh.factory<_i257.RegisterUseCase>(
      () => _i257.RegisterUseCase(authRepository: gh<_i432.AuthRepository>()),
    );
    gh.factory<_i678.AuthCubit>(
      () => _i678.AuthCubit(
        gh<_i995.LoginUseCase>(),
        gh<_i257.RegisterUseCase>(),
      ),
    );
    gh.factory<_i641.GetCategoriesUseCase>(
      () => _i641.GetCategoriesUseCase(gh<_i31.HomeRepository>()),
    );
    gh.factory<_i228.GetBrandsUseCase>(
      () => _i228.GetBrandsUseCase(gh<_i31.HomeRepository>()),
    );
    gh.factory<_i115.GetProductsUseCase>(
      () => _i115.GetProductsUseCase(gh<_i31.HomeRepository>()),
    );
    gh.factory<_i523.ProductCubit>(
      () => _i523.ProductCubit(gh<_i115.GetProductsUseCase>()),
    );
    gh.factory<_i812.HomeCubit>(
      () => _i812.HomeCubit(
        getCategoriesUseCase: gh<_i641.GetCategoriesUseCase>(),
        getBrandsUseCase: gh<_i228.GetBrandsUseCase>(),
      ),
    );
    return this;
  }
}
