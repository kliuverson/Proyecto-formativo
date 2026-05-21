import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_error.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService profileService;

  ProfileCubit({required this.profileService})
      : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileLoading());

    try {
      final response = await profileService.getUserProfile();

      final user = UserProfileModel.fromJson(response);

      emit(ProfileLoaded(user));
    } catch (e) {
      final error = ProfileErrorMessage(
        errorMessage: e.toString(),
      );

      emit(ProfileFailure(error.getError()));
    }
  }

  Future<void> refreshProfile() async {
    await getUserProfile();
  }

  Future<void> updateUserProfile({
    required String nombre,
    required String apellido,
    required String correo,
    required String numeroTelefono,
    required String username,
  }) async {
    if (state is! ProfileLoaded) return;

    final currentUser = (state as ProfileLoaded).user;

    emit(ProfileUpdating(currentUser));

    try {
      final response = await profileService.updateUserProfile(
        nombre: nombre,
        apellido: apellido,
        correo: correo,
        numeroTelefono: numeroTelefono,
        username: username,
      );

      final updatedUser =
          UserProfileModel.fromJson(response["user"]);

      emit(ProfileUpdated(updatedUser));

      emit(ProfileLoaded(updatedUser));
    } catch (e) {
      final error = ProfileErrorMessage(
        errorMessage: e.toString(),
      );

      emit(ProfileFailure(error.getError()));

      emit(ProfileLoaded(currentUser));
    }
  }
}