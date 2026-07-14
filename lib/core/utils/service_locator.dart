import 'package:final_project/core/api/dio_helper.dart';
import 'package:final_project/core/utils/secure_local_storage.dart';
import 'package:final_project/feature/auth/cubit/auth_cubit.dart';
import 'package:final_project/feature/auth/data/repo/auth_repo.dart';
import 'package:final_project/feature/home/data/repos/home_repo.dart';
import 'package:final_project/feature/home/presentation/cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
// All Dependencies over the app are registered here
void setUpServiceLocator() {
  // LazySingleton ===> Single instance throughout the app lifecycle,
  // and created when it is requested for the first time only

  // Core services
  locator.registerLazySingleton<DioHelper>(() => DioHelper());
  locator.registerLazySingleton<SecureLocalStorageHelper>(
    () => SecureLocalStorageHelper(),
  );

  // Repositories (LazySingleton - single instance)
  locator.registerLazySingleton<AuthRepo>(() => AuthRepo(locator<DioHelper>()));
  locator.registerLazySingleton<HomeRepo>(() => HomeRepo(locator<DioHelper>()));
  // locator.registerLazySingleton<CartRepo>(() => CartRepo(locator<DioHelper>()));
  // locator.registerLazySingleton<AddressesRepo>(
  //   () => AddressesRepo(locator<DioHelper>()),
  // );

  // Cubits (Factory - new instance each time)
  locator.registerFactory<AuthCubit>(() => AuthCubit());
  locator.registerFactory<ProductSCubit>(() => ProductSCubit());
  // locator.registerFactory<CategoriesCubit>(() => CategoriesCubit());
  // locator.registerFactory<CartCubit>(() => CartCubit());
}

