part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserProfileModel user;

  const ProfileLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

final class ProfileUpdating extends ProfileState {
  final UserProfileModel user;

  const ProfileUpdating(this.user);

  @override
  List<Object?> get props => [user];
}

final class ProfileUpdated extends ProfileState {
  final UserProfileModel user;

  const ProfileUpdated(this.user);

  @override
  List<Object?> get props => [user];
}

final class ProfileFailure extends ProfileState {
  final String message;

  const ProfileFailure(this.message);

  @override
  List<Object?> get props => [message];
}