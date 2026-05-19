import 'package:co_stock/application/blocs/prefs_bloc/prefs_bloc.dart';
import 'package:co_stock/application/blocs/profile_bloc/profile_bloc.dart';
import 'package:co_stock/application/services/session_service.dart';
import 'package:co_stock/data/local_storage/i_local_storage.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/shared_preferences_storage.dart';
import 'package:co_stock/presentation/navigation/app_router.dart';
import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:co_stock/presentation/widgets/snack_listener.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ILocalStorage.init(SharedPreferencesManager());

  /// Для срабатывания AuthGuards
  final userId = await LocalStorageService.getAuth();
  SessionService.id = userId;

  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: AppLocale.fallbackLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PrefsBloc()),

        /// Отключаем [lazy], чтобы он сразу выполнил внутри себя [.init()]
        /// Иначе вызовет [.init()] только при первом обращении к нему
        BlocProvider(create: (_) => ProfileBloc(), lazy: false),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrefsBloc, PrefsState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'CoStock',
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          theme: state.themeData,
          themeMode: state.themeMode,
          locale: state.getLocale,
          builder: (context, child) =>
              SnackListener(child: child ?? const SizedBox()),
        );
      },
    );
  }
}
