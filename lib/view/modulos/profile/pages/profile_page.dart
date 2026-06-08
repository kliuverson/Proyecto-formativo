import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:ferremateriales/view/modulos/profile/cubit/profile_cubit.dart';
import 'package:ferremateriales/view/modulos/profile/pages/profile_failure_page.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/profile_body_section.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Perfil actualizado correctamente")),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }

          if (state is ProfileFailure) {
            return ProfileFailureView(
              text: state.message,
              onRetry: () => context.read<ProfileCubit>().getUserProfile(),
            );
          }

          if (state is ProfileLoaded ||
              state is ProfileUpdating ||
              state is ProfileUpdated) {
            final user =
                state is ProfileLoaded
                    ? state.user
                    : state is ProfileUpdating
                    ? state.user
                    : (state as ProfileUpdated).user;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeaderSection(user: user),
                      ProfileBodySection(
                        user: user,
                        onTap: () => context.read<AuthCubit>().logout(),
                      ),
                    ],
                  ),
                ),
                if (state is ProfileUpdating)
                  Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    ),
                  ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

