import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
    required this.sityId,
  }) : super(key: key);
  final String sityId;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
      children: [
        Text('data'),
        Text('data'),
        Text('data'),
        Text('data'),
      ],
    )));
  }
}
