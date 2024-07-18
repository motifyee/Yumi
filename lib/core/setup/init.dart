import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:common_code/core/setup/awesome_notifications.dart';
import 'package:common_code/core/setup/crashlyticts.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/setup/interceptor.dart';
import 'package:yumi/global.dart';
import 'package:common_code/common_code.dart';

Future init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // to work with custom domains
  await BaseUrl.load();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WakelockPlus.enable();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Bloc.observer = SimpleBlocObserver();

  await initCrashlytics();

  try {
    NotificationService.initialize();
  } catch (error) {
    return;
  }

  await inject();

  APIClient.getToken = () => G().rd<UserCubit>().state.user.accessToken;
  APIClient.addInterceptor(APIInterceptor());

  G().listenConnectivity();
}

// class MyBlocDelegate extends BlocDelegate  {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     debugPrint(event);
//     super.onEvent(bloc, event);
//   }

//   @override
//   void onError(Bloc bloc, Object error, StackTrace stackTrace) {
//     debugPrint(error);
//     super.onError(bloc, error, stackTrace);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     debugPrint(transition);
//     super.onTransition(bloc, transition);
//   }
// }

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('\n${bloc.runtimeType}');
    // ignore: avoid_print
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('\n${bloc.runtimeType} $transition\n');
    // ignore: avoid_print
    // debugPrint(transition);
    // debugPrint('----------------------------------------------------------\n');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('\n${bloc.runtimeType} $error $stackTrace\n');
    // ignore: avoid_print
    // debugPrint(stackTrace);
    // debugPrint('----------------------------------------------------------\n');
  }
}
