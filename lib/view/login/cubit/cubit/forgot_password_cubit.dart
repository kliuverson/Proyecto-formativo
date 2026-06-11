import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/service/auth_service.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthService authService;

  ForgotPasswordCubit({required this.authService})
    : super(ForgotPasswordState());

  Future<void> forgotPassword(String correo) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    try {
      final response = await authService.forgotPassword(correo);
      emit(state.copyWith(isLoading: false, successMessage: response));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString().replaceFirst("Exception: ", ""),
        ),
      );
    }
  }
}
