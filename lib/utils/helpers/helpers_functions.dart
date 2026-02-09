import 'package:flutter/material.dart';

class THelpersFunctions{
  
  static bool esModoOscuro(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}