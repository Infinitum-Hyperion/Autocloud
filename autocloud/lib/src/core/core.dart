library autocloud.sdk.core;

import 'package:thp_autocloud/autocloud_sdk.dart';

part './architecture/autonomic_component.dart';
part './architecture/autonomic_motor_cell.dart';
part './architecture/autonomic_sensory_cell.dart';
part './architecture/objectives.dart';

part './data_structures/table.dart';
part './data_structures/storable.dart';

typedef JSON = Map<String, Object?>;

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
