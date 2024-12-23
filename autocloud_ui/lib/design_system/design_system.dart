library autocloud.ui.ds;

import 'package:autocloud_sdk/autocloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:autocloud_ui/utils/meta.dart';

part './colors.dart';
part 'menus/navigation_menu.dart';
part 'menus/navigation_rail.dart';
part 'globals/global_app_bar.dart';
part 'globals/global_nav_rail.dart';
part 'globals/global_scaffold.dart';
part './globals/global_state.dart';
part './globals/transitions.dart';

part './buttons/button.dart';
part './buttons/expandable_icon_button.dart';

part './fonts/fonts.dart';

part './containers/pane.dart';

enum ButtonState { inactive, hovered, pressed, active }

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
  appBarTheme: const AppBarTheme(
    color: ACPColor.blue,
    titleTextStyle: TextStyle(color: ACPColor.white),
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ACPColor.blue),
  ),
  useMaterial3: true,
);
