import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maxidom/core/auto_route/route.dart';
import 'package:maxidom/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<SityBloc, SityBlocState>(
        bloc: _newsBloc,
        builder: (context, state) {
          // состояние ошибки. хотя его тут не должно быть
          if (state is ErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.toString()),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            });

            return const Center(
                child: Text(
              "Ошибка получения данных",
              style: TextStyle(color: Colors.black),
            ));
          }

          // состояние загрузки
          if (state is LoadingIdSityState) {
            return const Center(child: CircularProgressIndicator());
          }

          // состояние когда получили ID города
          if (state is LoadedIdSityState) {
            final String sityId = state.sity.sityID;
            _pushWeatherPage(
              context: context,
              sityId: sityId,
            );
          }

          // без состояния из блока
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: sityController),
              ElevatedButton(
                onPressed: () => _newsBloc.add(
                  LoadWeatherEvent(sity: sityController.text),
                ),
                child: const Text('Проверить погоду'),
              ),
            ],
          );
        },
      ),
    );
  }
}

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
