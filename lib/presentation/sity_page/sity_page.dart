import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maxidom/core/auto_route/route.dart';
import 'package:maxidom/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxidom/core/generals_widgets/custom_elevated_buttom.dart';
import 'bloc/sity_bloc_bloc.dart';

@RoutePage()
class SityPage extends StatefulWidget {
  const SityPage({Key? key}) : super(key: key);

  @override
  State<SityPage> createState() => _SityPageState();
}

class _SityPageState extends State<SityPage> {
  TextEditingController sityController = TextEditingController();

  @override
  void dispose() {
    sityController.dispose();
    super.dispose();
  }

  final _sityBloc = G<SityBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: sityController),
          BlocBuilder<SityBloc, SityBlocState>(
            bloc: _sityBloc,
            builder: (context, state) {
              // состояние ошибки. хотя его тут не должно быть,
              // должен быть на 2 второй странице
              if (state is ErrorState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error.toString()),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                });

                return Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () => _sityBloc.add(
                        LoadWeatherEvent(sity: sityController.text),
                      ),
                      child: const Text('Проверить погоду'),
                    ),
                    const Text(
                      "Ошибка получения данных",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                );
              }

              // состояние загрузки
              if (state is LoadingIdSityState) {
                return CustomElevatedButton(
                  onPressed: () {},
                  child: const CircularProgressIndicator(),
                );
              }

              // состояние когда получили ID города
              if (state is LoadedIdSityState) {
                final String sityId = state.sity.sityID;
                _pushWeatherPage(
                  context: context,
                  sityId: sityId,
                );
              }

              return CustomElevatedButton(
                onPressed: () => _sityBloc.add(
                  LoadWeatherEvent(sity: sityController.text),
                ),
                child: const Text('Проверить погоду'),
              );
            },
          ),
        ],
      ),
    );
  }
}

// переход на другую страницу
void _pushWeatherPage({
  required BuildContext context,
  required String sityId,
}) {
  AutoRouter.of(context).push(
    WeatherPageRoute(
      sityId: sityId,
    ),
  );
}
