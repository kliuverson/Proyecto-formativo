import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mostrar_password_state.dart';

class MostrarPasswordCubit extends Cubit<MostrarPasswordState> {
  MostrarPasswordCubit() : super(const MostrarPasswordState(isVisible: false));

  void alternarContra (){
    emit(MostrarPasswordState(isVisible: !state.isVisible));
  }
}
