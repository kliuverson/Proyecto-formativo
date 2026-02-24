import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/device_utility/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
    this.title,
    this.action,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnPressed, this.iconColor,
  });

  final Widget? title;
  final List<Widget>? action;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSize.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }
                },
                icon: Icon(CupertinoIcons.back, color: iconColor,),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,
        title: title,
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeigth());
}