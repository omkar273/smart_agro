import 'package:get_it/get_it.dart';
import 'package:smart_agro/features/auth/data/datasources/auth_datasource.dart';
import 'package:smart_agro/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:smart_agro/features/auth/domain/repositories/auth_repo.dart';
import 'package:smart_agro/features/auth/domain/usecases/check_user_usecase.dart';
import 'package:smart_agro/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:smart_agro/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:smart_agro/core/secrets/supabase_keys.dart';

final locator = GetIt.instance;

Future<void> servicelocatorInit() async {
  final Supabase supabase = await Supabase.initialize(
    url: SupabaseKeys.SUPABASE_URL,
    anonKey: SupabaseKeys.SUPABASE_ANON_KEY,
  );

  locator.registerLazySingleton<SupabaseClient>(() => supabase.client);


// datasources
  locator.registerLazySingleton<AuthDatasource>(
    () => AuthDatasourceImpl(client: locator()),
  );

// repositories
  locator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(datasource: locator()),
  );

// usecase
  locator.registerFactory(
    () => SendOtpUsecase(authRepo: locator()),
  );
  locator.registerFactory(
    () => VerifyOtpUsecase(authRepo: locator()),
  );
  locator.registerFactory(
    () => CheckUserUsecase(authRepo: locator()),
  );
}
