import 'package:auto_route/auto_route.dart';
import 'package:nested/nested.dart';
import 'package:yumi/app_target.dart';

abstract class AppConfig2 {
  YumiApp get appTargetUser;

  List<SingleChildWidget> get blocProviders;

  // RootStackRouter get appRouter;
}

// typedef AppBuilder = Widget Function(BuildContext context, AppConfig config);

