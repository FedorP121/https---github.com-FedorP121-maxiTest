import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maxidom/repositories/repository.dart';

part 'sity_bloc_event.dart';
part 'sity_bloc_state.dart';

class SityBloc extends Bloc<SityBlocEvent, SityBlocState> {
  SityBloc({required AbstractWeatherRepository abstractWeatherRepository})
      : _abstractWeatherRepository = abstractWeatherRepository,
        super(SityBlocInitial()) {
    on<LoadWeatherEvent>(_loadWeather);
  }
  final AbstractWeatherRepository _abstractWeatherRepository;

  Future<void> _loadWeather(
    LoadWeatherEvent event,
    Emitter<SityBlocState> emit,
  ) async {
    if (event.sity.isEmpty) {
      emit(const ErrorState(error: 'Введите название города'));
    } else {
      emit(LoadingIdSityState());
      try {
        final Sity sity =
            await _abstractWeatherRepository.getIDSity(event.sity);
        emit(LoadedIdSityState(sity: sity));
      } catch (e) {
        emit(ErrorState(error: e));
      }
    }
  }
}
