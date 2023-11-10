import 'package:equatable/equatable.dart';

class Sity extends Equatable {
  const Sity({
    required this.sityID,
  });
  final String sityID;

  @override
  List<Object?> get props => [sityID];
}
