part of autocloud.sdk.core;

abstract class AutonomicSensoryCell extends AutonomicCell {
  AutonomicSensoryCell({
    required super.observatory,
    required super.elementId,
    required super.systemId,
  });

  void init();
}
