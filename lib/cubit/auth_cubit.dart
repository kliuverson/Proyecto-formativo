import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isAuthenticated: false));

  void loginSucces(String token, Map<String, dynamic> userData) {
    emit(AuthState(isAuthenticated: true, token: token, userData: userData));
  }

  Future<void> logout() async {
    final SharedPreferences prefers = await SharedPreferences.getInstance();
    await prefers.remove("token");
    emit(AuthState(isAuthenticated: false));
  }
}
