// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:common_code/components/loading_indicator/loading_page.dart'
    as _i1;

abstract class $CommonRouter extends _i2.RootStackRouter {
  $CommonRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.LoadingPage]
class LoadingRoute extends _i2.PageRouteInfo<void> {
  const LoadingRoute({List<_i2.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
