import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/service/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService profileService;

  ProfileCubit({required this.profileService}) : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    try {
      final response = await profileService.getUserProfile();
      final user = UserProfileModel.fromJson(response);

      emit(ProfileSuccess(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> refreshProfile() async {
    await getUserProfile();
  }
}


