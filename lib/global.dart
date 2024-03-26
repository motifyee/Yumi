import 'package:flutter/material.dart';

class G {
  // static const String API_KEY = "";
  // static const String BASE_URL = "";

  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();
  // static get navigator => navigatorKey.currentState;
  // static get currentContext => navigatorKey.currentContext;
  // static ScaffoldState get scaffold => Scaffold.of(currentContext);

  static final GlobalKey builderKey = GlobalKey();
  static BuildContext get cContext => builderKey.currentContext!;
  static ScaffoldState get scaffold => Scaffold.of(cContext);
}
