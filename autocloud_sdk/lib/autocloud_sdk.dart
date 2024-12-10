library autocloud.sdk;

import 'package:flutter/widgets.dart';

class AutocloudProject {
  final MarkhorConfigs markhorConfigs;

  const AutocloudProject({
    required this.markhorConfigs,
  });
}

class MarkhorConfigs {
  final Map<String, WidgetBuilder> liveTelemetryViewModes;

  const MarkhorConfigs({
    this.liveTelemetryViewModes = const {},
  });
}
