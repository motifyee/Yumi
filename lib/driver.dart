import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/app_config/driver/dirver_app_config.dart';
import 'package:yumi/app_config/yumi_app.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WakelockPlus.enable();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Bloc.observer = SimpleBlocObserver();

  await init();

  AppTarget.user = AppTargetUser.drivers;
  runApp(const YumiDriver());
}

var config = DriverAppConfig();

class YumiDriver extends StatelessWidget {
  const YumiDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return YumiApp(
      config: config,
      builder: (context, child) => _builder(context, child),
    );
  }
}

Widget _builder(context, child) {
  return Builder(
      key: G.builderKey,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: SafeArea(
            child: Container(
              color: ThemeSelector.colors.background,
              child: child ?? const Text(''),
            ),
          ),
        );
      });
}

// class MyBlocDelegate extends BlocDelegate  {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     print(event);
//     super.onEvent(bloc, event);
//   }

//   @override
//   void onError(Bloc bloc, Object error, StackTrace stackTrace) {
//     print(error);
//     super.onError(bloc, error, stackTrace);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     print(transition);
//     super.onTransition(bloc, transition);
//   }
// }

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('\n${bloc.runtimeType}');
    // ignore: avoid_print
    print(change);
    debugPrint('----------------------------------------------------------\n');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('\n${bloc.runtimeType} $transition\n');
    // ignore: avoid_print
    print(transition);
    debugPrint('----------------------------------------------------------\n');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('\n${bloc.runtimeType} $error $stackTrace\n');
    // ignore: avoid_print
    print(stackTrace);
    debugPrint('----------------------------------------------------------\n');
  }
}
