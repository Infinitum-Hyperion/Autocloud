library autocloud.sdk.observatory;

import 'package:thp_autocloud/autocloud_sdk.dart';

part './context_monitor.dart';
part './log_monitor.dart';

/// The Markhor [Observatory] provides telemetry tracking services
class Observatory {
  final Datahouse datahouse;
  final ContextMonitor contextMonitor;
  final LogMonitor logMonitor;

  const Observatory({
    required this.datahouse,
    required this.contextMonitor,
    required this.logMonitor,
  });
}
