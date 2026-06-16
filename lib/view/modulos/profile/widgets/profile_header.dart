import 'package:ferremateriales/common/widgets/appbar/app_bar.dart';
import 'package:ferremateriales/common/widgets/coustom_shapes/containers/primary_header_container.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/user_profile_title.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
    required this.user,
  });

  final UserProfileModel user;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return TPrimaryHeaderContainer(
      child: Column(
        children: [
          TAppbar(
            iconColor: Colors.white,
            showBackArrow: true,
            title: Text(
              tr.myAccount,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: Colors.white),
            ),
          ),
    
          TUserProfile(user: user),
    
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

