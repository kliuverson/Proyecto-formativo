part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  final Map<String, dynamic>? fieldErrors;

  const RegisterState({
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
    this.fieldErrors,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    Map<String, dynamic>? fieldErrors,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage ?? this.successMessage,
      fieldErrors: fieldErrors ?? this.fieldErrors,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    successMessage,
    fieldErrors,
  ];
}
