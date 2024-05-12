import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yumi/app/core/setup/awesome_notifications.dart';
import 'package:yumi/app/core/setup/crashlyticts.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/app/core/setup/signalr.dart';

Future init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WakelockPlus.enable();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Bloc.observer = SimpleBlocObserver();

  await initCrashlytics();

  await NotificationService.initialize();

  Signalr.startConnection();

  await inject();
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
