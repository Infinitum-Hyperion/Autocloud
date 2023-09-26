part of autocloud.sdk.core;

class AutonomicComponent<I, O> extends AutonomicElement {
  final AutonomicCell cell;
  final O Function(I) action;

  AutonomicComponent({
    required this.cell,
    required this.action,
    required super.elementId,
    required super.systemId,
  });

  @override
  operator ==(Object? other) {
    return other is AutonomicComponent && other.cell == cell;
  }
}
