import 'package:ferremateriales/utils/constants/size.dart';
import 'package:flutter/widgets.dart';

class TSpacingStyleAppBar {
  TSpacingStyleAppBar._();

  static const EdgeInsetsGeometry paddingAppBar = EdgeInsetsGeometry.only(
    top: TSize.appBarHeight,
    left: TSize.defaultSpace,
    right: TSize.defaultSpace,
    bottom: TSize.defaultSpace
  );
}
