import 'package:flutter/material.dart';
import 'package:maxidom/gismeteo_app.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializaeBeforeAppStart();
  runApp(const GismeteoApp());
}
