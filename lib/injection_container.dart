import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbeeh_app/app_router.dart';
import 'package:tasbeeh_app/core/database/database.dart';
import 'package:tasbeeh_app/features/activity/data/datasources/activity_local_data_source.dart';
import 'package:tasbeeh_app/features/activity/data/repositories/activity_repository_impl.dart';
import 'package:tasbeeh_app/features/activity/domain/repositories/activity_repository.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/add_activity.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/delete_activity.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/get_all_activities.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/update_activity.dart';
import 'package:tasbeeh_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:tasbeeh_app/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:tasbeeh_app/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:tasbeeh_app/features/counter/domain/repositories/counter_repository.dart';
import 'package:tasbeeh_app/features/counter/domain/usecases/increment_activity.dart';
import 'package:tasbeeh_app/features/counter/domain/usecases/reset_activity.dart';
import 'package:tasbeeh_app/features/counter/presentation/cubit/counter_cubit.dart';

final GetIt getIt = GetIt.instance;

class InjectionContainer {
  static void init() {
    _registerDependencies();
    _regiseredActivity();
    _regiseredCounter();
  }

  static void _registerDependencies() {
    //Router
    getIt.registerLazySingleton<GoRouter>(() => AppRouter.routerConfig);

    // Database
    getIt.registerLazySingleton(() => AppDatabase());
  }

  // --- Activity Feature ---
  static void _regiseredActivity() {
    // Data Source
    getIt.registerLazySingleton<ActivityLocalDataSource>(
      () => ActivityLocalDataSourceImpl(getIt()),
    );
    // Repository
    getIt.registerLazySingleton<ActivityRepository>(
      () => ActivityRepositoryImpl(getIt()),
    );
    // Use Cases
    getIt.registerLazySingleton(() => GetAllActivities(getIt()));
    getIt.registerLazySingleton(() => AddActivity(getIt()));
    getIt.registerLazySingleton(() => UpdateActivity(getIt()));
    getIt.registerLazySingleton(() => DeleteActivity(getIt()));
    // Bloc
    getIt.registerFactory(
      () => ActivityBloc(
        getAllActivities: getIt(),
        addActivity: getIt(),
        updateActivity: getIt(),
        deleteActivity: getIt(),
      ),
    );
  }

  // --- Counter Feature ---
  static void _regiseredCounter() {
    // Data Source
    getIt.registerLazySingleton<CounterLocalDataSource>(
      () => CounterLocalDataSourceImpl(getIt()),
    );
    // Repository
    getIt.registerLazySingleton<CounterRepository>(
      () => CounterRepositoryImpl(getIt()),
    );
    // Use Cases
    getIt.registerLazySingleton(() => IncrementActivity(getIt()));
    getIt.registerLazySingleton(() => ResetActivity(getIt()));
    // Cubit
    getIt.registerFactory(
      () => CounterCubit(incrementActivity: getIt(), resetActivity: getIt()),
    );
  }
}