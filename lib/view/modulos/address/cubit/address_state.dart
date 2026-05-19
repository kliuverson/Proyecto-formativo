part of 'address_cubit.dart';

class AddressState extends Equatable {
  final bool isLoading;
  final String? error;
  final String? success;
  final List<AddressModel> addresses;

  const AddressState({
    this.isLoading = false,
    this.error,
    this.success,
    this.addresses = const [],
  });

  AddressState copyWith({
    bool? isLoading,
    String? error,
    String? success,
    List<AddressModel>? addresses,
  }) {
    return AddressState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      success: success,
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        success,
        addresses,
      ];
}