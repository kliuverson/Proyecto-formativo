import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/service/auth_service.dart';
import 'package:ferremateriales/view/modulos/register/controller/auth_register_error_controller.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthService authService;

  RegisterCubit(this.authService) : super(RegisterState());

  Future<void> register(
    String nombre,
    String apellido,
    String nombreUsuario,
    String correo,
    String telefono,
    String password,
  ) async {

    //VALIDACIÓN FRONTEND
    final Map<String, String> fieldErrors = {};

    if (nombre.trim().isEmpty) {
      fieldErrors["nombre"] = "El nombre es obligatorio";
    }

    if (apellido.trim().isEmpty) {
      fieldErrors["apellido"] = "El apellido es obligatorio";
    }

    if (nombreUsuario.trim().isEmpty) {
      fieldErrors["username"] = "El usuario es obligatorio";
    }

    if (!correo.contains("@")) {
      fieldErrors["correo"] = "Correo inválido";
    }

    if (telefono.length < 10) {
      fieldErrors["telefono"] = "Teléfono inválido";
    }

    if (password.length < 8) {
      fieldErrors["password"] = "Mínimo 8 caracteres";
    }

   
    if (fieldErrors.isNotEmpty) {
      emit(state.copyWith(fieldErrors: fieldErrors));
      return;
    }

    emit(
      state.copyWith(isLoading: true, errorMessage: null, fieldErrors: null),
    );
    try {
      final response = await authService.register(
        nombre,
        apellido,
        nombreUsuario,
        correo,
        telefono,
        password,
      );
      emit(
        state.copyWith(
          isLoading: false,
          successMessage: response['message'] ?? 'Registro exitoso',
        ),
      );
    } catch (e) {
      if (e is List) {
        Map<String, String> fieldErrors = {};

        for (var error in e) {
          final field = error["field"];
          final message = error["message"];

          if (field == "numeroTelefono") {
            fieldErrors["telefono"] = message;
          } else {
            fieldErrors[field] = message;
          }
        }

        emit(state.copyWith(isLoading: false, fieldErrors: fieldErrors));

        return;
      }

      final AuthRegisterError error = AuthRegisterError(e);
      emit(
        state.copyWith(isLoading: false, errorMessage: error.getErrorMessage()),
      );
    }
  }
}
