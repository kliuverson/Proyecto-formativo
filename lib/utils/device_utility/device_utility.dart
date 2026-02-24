import 'package:flutter/material.dart';

class TDeviceUtils{

  static double getAppBarHeigth(){
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeigth(){
    return kBottomNavigationBarHeight;
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}