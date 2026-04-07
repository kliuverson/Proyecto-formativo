part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String? error;
  final String? token;
  final bool isLoading;

  const LoginState({this.isLoading = false, this.error, this.token});

  LoginState copyWith({bool? isLoading, String? error, String? token}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      token: token,
    );
  }

  @override
  List<Object?> get props => [isLoading, error,token];
}
