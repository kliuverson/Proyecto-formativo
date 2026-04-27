import 'package:ferremateriales/common/widgets/coustom_shapes/containers/circular_image.dart';
import 'package:ferremateriales/utils/constants/image_string.dart';
import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:ferremateriales/utils/helpers/string_extension.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  final UserProfileModel user;

  const ProfileHeaderCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final esModoOscuro = THelpersFunctions.esModoOscuro(context);
    return Column(
      children: [
        TCircularImage(
          imageUrl: TImage.userImage,
          size: 90,
          borderColor: esModoOscuro ? Colors.white : Colors.black,
        ),

        const SizedBox(height: 12),

        Text(
          "${user.nombre.capitalizeWords()} ${user.apellido.capitalizeWords()}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        const SizedBox(height: 5),

        Text(
          user.correo,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}