import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;

  LoginCubit({required this.authService}) : super(const LoginState());

  Future<void> login(String correo, String password) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final response = await authService.login(correo, password);
      final token = response["token"];
      final user = response["user"];

      final SharedPreferences prefers = await SharedPreferences.getInstance();
      await prefers.setString("token", token);

      // final userData = await authService.getUserData(token);
      emit(state.copyWith(isLoading: false, token: token, userData: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
