part of 'sity_bloc_bloc.dart';

abstract class SityBlocEvent extends Equatable {
  const SityBlocEvent();
}

class LoadWeatherEvent extends SityBlocEvent {
  const LoadWeatherEvent({
    required this.sity,
  });
  final String sity;
  @override
  List<Object?> get props => [];
}
