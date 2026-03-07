import 'package:ferremateriales/utils/constants/image_string.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          width: 200,
          image: AssetImage(
            isDark ? TImage.darkLogo : TImage.lightLogo,
          ),
        ),
        const SizedBox(height: TSize.defaultSpace),
        Text(
          TText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSize.md),
        Text(
          TText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}