// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:maxidom/presentation/sity_page/sity_page.dart' as _i1;
import 'package:maxidom/presentation/weather_page/weather_page.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SityPageRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SityPage(),
      );
    },
    WeatherPageRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherPageRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.WeatherPage(
          key: args.key,
          sityId: args.sityId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SityPage]
class SityPageRoute extends _i3.PageRouteInfo<void> {
  const SityPageRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SityPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SityPageRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WeatherPage]
class WeatherPageRoute extends _i3.PageRouteInfo<WeatherPageRouteArgs> {
  WeatherPageRoute({
    _i4.Key? key,
    required String sityId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WeatherPageRoute.name,
          args: WeatherPageRouteArgs(
            key: key,
            sityId: sityId,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherPageRoute';

  static const _i3.PageInfo<WeatherPageRouteArgs> page =
      _i3.PageInfo<WeatherPageRouteArgs>(name);
}

class WeatherPageRouteArgs {
  const WeatherPageRouteArgs({
    this.key,
    required this.sityId,
  });

  final _i4.Key? key;

  final String sityId;

  @override
  String toString() {
    return 'WeatherPageRouteArgs{key: $key, sityId: $sityId}';
  }
}
