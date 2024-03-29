library autocloud.sdk.core;

import 'dart:async';

import 'package:thp_autocloud/autocloud_sdk.dart';
import 'package:thp_autocloud/src/core/observatory/observatory.dart';

part './architecture/autonomic_component.dart';
part './architecture/autonomic_motor_cell.dart';
part './architecture/autonomic_sensory_cell.dart';
part './architecture/objectives.dart';

part './data_structures/table.dart';
part './data_structures/storable.dart';

typedef JSON = Map<String, Object?>;

class AutocloudGlobalConfigs {
  static SystemGoals? goals;
}

abstract class AutonomicElement {
  final String elementId;
  final String systemId;

  const AutonomicElement({
    required this.elementId,
    required this.systemId,
  });

  @override
  bool operator ==(Object other) =>
      other is AutonomicElement &&
      other.elementId == elementId &&
      other.systemId == systemId;
}

abstract class AutonomicCell extends AutonomicElement {
  final Observatory observatory;

  const AutonomicCell({
    required this.observatory,
    required super.elementId,
    required super.systemId,
  });
}

Future<Timer> activateSystem({
  required Duration interval,
  required SystemGoals goals,
}) async {
  final Timer t = Timer.periodic(interval, (_) {});
  AutocloudGlobalConfigs.goals = goals;
  return t;
}

void deactivateSystem(Timer t) {
  t.cancel();
}
