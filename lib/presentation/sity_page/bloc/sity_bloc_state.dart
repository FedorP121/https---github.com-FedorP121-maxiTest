part of 'sity_bloc_bloc.dart';

abstract class SityBlocState extends Equatable {
  const SityBlocState();
}

class SityBlocInitial extends SityBlocState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends SityBlocState {
  const ErrorState({
    required this.error,
  });

  final Object error;
  @override
  List<Object?> get props => [error];
}

class LoadingIdSityState extends SityBlocState {
  @override
  List<Object?> get props => [];
}

class LoadedIdSityState extends SityBlocState {
  const LoadedIdSityState({
    required this.sity,
  });
  final Sity sity;
  @override
  List<Object?> get props => [sity];
}
