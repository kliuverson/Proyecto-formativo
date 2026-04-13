part of 'mostrar_password_cubit.dart';

class MostrarPasswordState extends Equatable {

  final bool isVisible;

  const MostrarPasswordState({required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}


