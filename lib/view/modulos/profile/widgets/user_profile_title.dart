import 'package:ferremateriales/common/widgets/coustom_shapes/containers/circular_image.dart';
import 'package:ferremateriales/utils/constants/image_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TUserProfile extends StatelessWidget {
  const TUserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        imageUrl: TImage.userImage,
        size: 50,
        borderColor: Colors.grey.shade300,
      ),
      title: Text(
        "Jesus Bovea",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: Colors.white),
      ),
      subtitle: Text(
        "jdavid.bovea@gmail.com",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.square_pencil,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
