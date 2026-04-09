part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isAuthenticated;
  final String? token;
  final Map<String, dynamic>? userData;

  const AuthState({this.isAuthenticated = false, this.token, this.userData});

  AuthState copyWith({
    bool? isAuthenticated,
    String? token,
    Map<String, dynamic>? userData,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      userData: userData ?? this.userData,
    );
  }

  @override
  List<Object?> get props => [isAuthenticated, token, userData];
}
