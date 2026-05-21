import 'package:ferremateriales/common/widgets/coustom_shapes/containers/circular_image.dart';
import 'package:ferremateriales/utils/constants/image_string.dart';
import 'package:ferremateriales/utils/helpers/string_extension.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TUserProfile extends StatelessWidget {
  final UserProfileModel user;

  const TUserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        imageUrl: TImage.userImage,
        size: 50,
        borderColor: Colors.grey.shade300,
      ),
      title: Text(
        "${user.nombre.capitalizeWords()} ${user.apellido.capitalizeWords()}",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: Colors.white),
      ),
      subtitle: Text(
        user.correo,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/edit-profile',
            arguments: user,
          );
        },
        icon: Icon(CupertinoIcons.square_pencil, color: Colors.white, size: 26),
      ),
    );
  }
}
