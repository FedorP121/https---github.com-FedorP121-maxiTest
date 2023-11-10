import 'package:flutter/material.dart';

import 'core/auto_route/route.dart';
import 'core/theme/theme.dart';

class GismeteoApp extends StatefulWidget {
  const GismeteoApp({Key? key}) : super(key: key);

  @override
  State<GismeteoApp> createState() => _GismeteoAppState();
}

class _GismeteoAppState extends State<GismeteoApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'maxidom weather',
      theme: theme,
      routerConfig: _appRouter.config(),
    );
  }
}
