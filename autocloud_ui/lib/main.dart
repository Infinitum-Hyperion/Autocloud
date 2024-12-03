library autocloud.ui;

import 'package:autocloud_ui/design_system/design_system.dart';
import 'package:markhor_ui/main.dart';
import 'package:flutter/material.dart';

part './views/home_view.dart';

void main() {
  runApp(const AutocloudInterface());
}


class AutocloudInterface extends StatelessWidget {
  const AutocloudInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoCloud Platform',
      theme: autocloudTheme,
      initialRoute: '/home',
      routes: {
        '/home': (_) => const AutocloudHomeView(),
        '/markhor': (_) => MarkhorOverviewView(),
      },
    );
  }
}
