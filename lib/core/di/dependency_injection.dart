import 'dart:developer';

import 'package:payzabt/core/networking/network/app_api_constants.dart';
import 'package:payzabt/core/networking/network/dio_consumer.dart';

import '../../config/export/export.dart';
import '../networking/network/base_consumer.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// Register DioConsumer to handle API calls using Dio ///
  final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
    compact: true,
    maxWidth: 100,
    enabled: true,
    request: true,
    logPrint: (object) => log(object.toString(), name: "Api"),
  );
  final dio = Dio(
    BaseOptions(
      baseUrl: AppApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      connectTimeout: const Duration(minutes: 5),
    ),
  );
  dio.interceptors.addAll([
    // ChuckerDioInterceptor(),
    logger,
  ]);

  // //! dio
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<BaseConsumer>(() => DioConsumer(getIt<Dio>()));

  ///! FOR APP CUBIT ///
  getIt.registerFactory<AppCubit>(() => AppCubit());

  ///!MARK: FOR Auth  ///
  getIt.registerFactory<AuthCubit>(
          () => AuthCubit(getIt<AuthRepo>()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthApiServices());

  ///!MARK: FOR BudgetManagement  ///
  getIt.registerFactory<BudgetManagementCubit>(
          () => BudgetManagementCubit(getIt<BudgetManagementRepo>()));
  getIt.registerLazySingleton<BudgetManagementRepo>(() => BudgetManagementApiServices());

  ///!MARK: FOR Savings  ///
  getIt.registerFactory<SavingsCubit>(
          () => SavingsCubit(getIt<SavingsRepo>()));
  getIt.registerLazySingleton<SavingsRepo>(() => SavingsApiServices());

  ///!MARK: FOR Home  ///
  getIt.registerFactory<HomeCubit>(
          () => HomeCubit(getIt<HomeRepo>()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeApiServices());

  ///!MARK: FOR Transactions  ///
  getIt.registerFactory<TransactionsCubit>(
          () => TransactionsCubit(getIt<TransactionsRepo>()));
  getIt.registerLazySingleton<TransactionsRepo>(() => TransactionsApiServices());


  // ///!MARK: FOR Profile  ///
  // getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepo>()));
  // getIt.registerLazySingleton<ProfileRepo>(() => ProfileApiServices());

  // ///!MARK: FOR Notifications  ///
  // getIt.registerFactory<NotificationsCubit>(
  //   () => NotificationsCubit(getIt<NotificationsRepo>()),
  // );
  // getIt.registerLazySingleton<NotificationsRepo>(
  //   () => NotificationsApiServices(),
  // );

}

// void injectFCMToken(String? fcmToken) {
//   if (getIt.isRegistered(instance: fcmToken, instanceName: 'FCM_TOKEN')) {
//     getIt.unregister(instanceName: 'FCM_TOKEN');
//   }
//   getIt.registerLazySingleton<String>(() => fcmToken ?? '',
//       instanceName: 'FCM_TOKEN');
// }

// String get fcmToken => getIt<String>(instanceName: 'FCM_TOKEN');
