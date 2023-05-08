import 'package:cook_by_yourself/feature/data/datasources/remote_data_source.dart';
import 'package:cook_by_yourself/feature/data/datasources/remote_data_source_impl.dart';
import 'package:cook_by_yourself/feature/data/repositories/credential_repository_impl.dart';
import 'package:cook_by_yourself/feature/domain/repositories/credential_repository.dart';
import 'package:cook_by_yourself/feature/domain/usecases/usecases.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/credential/credential_cubit.dart';
import 'package:cook_by_yourself/feature/presentation/cubit/recipe/recipe_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/data/repositories/recipe_repository_impl.dart';
import 'feature/domain/repositories/recipe_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOC and CUBIT
  sl.registerFactory(
    () => AuthCubit(
      refreshTokenUseCase: sl(),
      isSignInUseCase: sl(),
      signOutUserCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CredentialCubit(
      signInUserUseCase: sl(),
      signUpUserUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => RecipeCubit(
      deleteFavoriteItemUseCase: sl(),
      getAllDishesUseCase: sl(),
      getDishItemUseCase: sl(),
      getFavoritesUseCase: sl(),
      setFavoriteItemUseCase: sl(),
      setFavoriteUseCase: sl(),
    ),
  );

  // USECASE
  sl.registerLazySingleton(() => SignInUserUseCase(credentialRepository: sl()));
  sl.registerLazySingleton(() => SignUpUserUseCase(credentialRepository: sl()));
  sl.registerLazySingleton(() => IsSignInUseCase(credentialRepository: sl()));
  sl.registerLazySingleton(() => SignOutUserCase(credentialRepository: sl()));
  sl.registerLazySingleton(
    () => ResetPasswordUseCase(credentialRepository: sl()),
  );

  sl.registerLazySingleton(
    () => RefreshTokenUseCase(credentialRepository: sl()),
  );

  sl.registerLazySingleton(
    () => GetFavoritesUseCase(recipeRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetAllDishesUseCase(recipeRepository: sl()),
  );
  sl.registerLazySingleton(
    () => DeleteFavoriteItemUseCase(recipeRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetDishItemUseCase(recipeRepository: sl()),
  );
  sl.registerLazySingleton(
    () => SetFavoriteUseCase(recipeRepository: sl()),
  );
  sl.registerLazySingleton(
    () => SetFavoriteItemUseCase(recipeRepository: sl()),
  );

  // REPOSITORY
  sl.registerLazySingleton<CredentialRepository>(
    () => CredentialRepositoryImpl(
      credentialRemoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<CredentialRemoteDataSource>(
    () => CredentialRemoteDataSourceImpl(
      client: http.Client(),
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(remoteDataSource: sl()),
  );

  // EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
