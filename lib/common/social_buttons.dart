import 'package:ferremateriales/utils/constants/image_string.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(TImage.logoFacebook),
              width: TSize.iconMd,
              height: TSize.iconMd,
            ),
          ),
        ),
        const SizedBox(width: TSize.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(TImage.logoGoogle),
              width: TSize.iconMd,
              height: TSize.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}