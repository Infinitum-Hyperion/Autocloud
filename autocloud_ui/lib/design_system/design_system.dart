library autocloud.ui.ds;

import 'package:flutter/material.dart';

part './colors.dart';
part './drawer.dart';
part './global_app_bar.dart';
part './global_drawer.dart';
part './global_scaffold.dart';

final GlobalKey<ScaffoldState> currentGlobalScaffoldKey = GlobalKey();

final ThemeData autocloudTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: ACPColor.blue,
    onPrimary: ACPColor.white,
    primaryContainer: ACPColor.white.withOpacity(0.1),
    onPrimaryContainer: ACPColor.white,
  ),
  dividerTheme: DividerThemeData(
    color: ACPColor.white.withOpacity(0.3),
    space: 10,
  ),
  useMaterial3: true,
);
