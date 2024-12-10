library autocloud.ui;

import 'package:autocloud_ui/design_system/design_system.dart';
import 'package:autocloud_ui/utils/meta.dart';
import 'package:markhor_ui/main.dart';
import 'package:flutter/material.dart';

part 'views/home_page/home_page.dart';

class AutocloudInterface extends StatelessWidget {
  const AutocloudInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoCloud',
      initialRoute: "${PageViewId.autocloud.id}${PageViewId.ac_home.id}",
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final platform in TargetPlatform.values)
              platform: const NoTransitionsBuilder(),
          },
        ),
      ),
      routes: {
        "${PageViewId.autocloud.id}${PageViewId.ac_home.id}": (_) =>
            const AutocloudHomePage(),
        "${PageViewId.markhor.id}${PageViewId.mk_liveTelemetry.id}": (_) =>
            MarkhorLiveTelemetryView(
              viewModes: GlobalState
                  .autocloudProject.markhorConfigs.liveTelemetryViewModes,
            ),
      },
    );
  }
}
