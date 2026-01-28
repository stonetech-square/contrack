import 'dart:io';

import 'package:contrack/src/app/app_bloc_observer.dart';
import 'package:contrack/src/app/contrack_app.dart';
import 'package:contrack/src/app/di/injection.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1200, 850),
    minimumSize: Size(1200, 850),
    backgroundColor: Platform.isMacOS ? Colors.transparent : null,
    skipTaskbar: false,
    titleBarStyle: Platform.isMacOS
        ? TitleBarStyle.hidden
        : TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );

  configureDependencies();
  await GetIt.I<UserSession>().initialize();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  Bloc.observer = AppBlocObserver();
  await SentryFlutter.init((options) {
    options.dsn =
        'https://b5b3fc1c582b76996e49a3435737929d@o4506044291874816.ingest.us.sentry.io/4510751302811648';
    options.sendDefaultPii = true;
    options.enableLogs = true;
    options.tracesSampleRate = 1.0;
    options.profilesSampleRate = 1.0;
    options.replay.sessionSampleRate = 0.1;
    options.replay.onErrorSampleRate = 1.0;
  }, appRunner: () => runApp(SentryWidget(child: ContrackApp())));
}
