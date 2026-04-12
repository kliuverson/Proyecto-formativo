part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String? error;
  final String? token;
  final bool isLoading;
  final Map<String, dynamic>? userData;

  const LoginState({
    this.isLoading = false,
    this.error,
    this.token,
    this.userData,
  });

  LoginState copyWith({bool? isLoading, String? error, String? token, Map<String, dynamic>? userData}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      token: token ?? this.token,
      userData: userData ?? this.userData,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, token, userData];
}
