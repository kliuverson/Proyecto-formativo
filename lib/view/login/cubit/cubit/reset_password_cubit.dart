import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/service/auth_service.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthService authService;

  ResetPasswordCubit({
    required this.authService,
  }) : super(ResetPasswordInitial());

  Future<void> resetPassword(
    String token,
    String password,
  ) async {
    emit(ResetPasswordLoading());

    try {
      final message = await authService.resetPassword(
        token,
        password,
      );

      emit(
        ResetPasswordSuccess(message),
      );
    } catch (e) {
      emit(
        ResetPasswordError(
          e.toString().replaceFirst(
            "Exception: ",
            "",
          ),
        ),
      );
    }
  }
}