import 'package:maxidom/presentation/sity_page/bloc/sity_bloc_bloc.dart';
import 'package:maxidom/repositories/repository.dart';

import 'di.dart';

Future<void> initializaeBeforeAppStart() async {
  final repository = WeatherApi();

  G.registerLazySingleton(
    () => SityBloc(abstractWeatherRepository: repository),
  );

  // G.registerFactory(
  //   () => WeatherBloc(),
  // );
}
