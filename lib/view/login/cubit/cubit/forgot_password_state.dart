part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final bool isLoading;
  final String? error;
  final String? successMessage;

  const ForgotPasswordState({this.isLoading = false, this.error, this.successMessage});

  ForgotPasswordState copyWith({
    bool? isLoading,
    String? error,
    String? successMessage,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, successMessage];
}
