library autocloud.sdk.core;

import 'package:thp_autocloud/autocloud_sdk.dart';

part './architecture/autonomic_component.dart';
part './architecture/autonomic_cell.dart';

abstract class AutonomicElement {
  final String elementId;
  final String systemId;

  const AutonomicElement({
    required this.elementId,
    required this.systemId,
  });

  @override
  bool operator ==(Object other) =>
      other is AutonomicElement && other.elementId == elementId;
}
