import 'package:flutter/cupertino.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness ==
    Brightness.dark; // isDarkMOde가 true면 다크모드 안에 있다.
