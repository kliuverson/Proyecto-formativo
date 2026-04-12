import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isAuthenticated: false, isLoading: true));

  void loginSucces(String token, Map<String, dynamic> userData) {
    emit(AuthState(isAuthenticated: true, token: token, userData: userData, isLoading: false));
  }

  Future<void> logout() async {
    final SharedPreferences prefers = await SharedPreferences.getInstance();
    await prefers.remove("token");
    emit(AuthState(isAuthenticated: false));
  }

  Future<void> checkAuthStatus() async {
    emit(AuthState(isAuthenticated: false, isLoading: true));

    await Future.delayed(const Duration(seconds: 3)); 

    final SharedPreferences prefers = await SharedPreferences.getInstance();
    final token = prefers.getString("token");

    if (token != null) {
      final bool isExpired = JwtDecoder.isExpired(token);
      if (isExpired) {
        await prefers.remove("token");
        emit(AuthState(isAuthenticated: false, isLoading: false));
        return;
      }
      emit(AuthState(isAuthenticated: true, token: token, isLoading: false));
    } else {
      emit(AuthState(isAuthenticated: false, isLoading: false));
    }
  }
}
