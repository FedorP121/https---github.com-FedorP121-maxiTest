import 'package:auto_route/auto_route.dart';
import 'package:maxidom/core/auto_route/route.gr.dart';

// import 'route.gr.dart';

export 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: '')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SityPageRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: WeatherPageRoute.page,
      path: '/oneNews',
    )
  ];
}

// flutter packages pub run build_runner build   - команда для билда
