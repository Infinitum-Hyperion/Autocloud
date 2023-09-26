part of autocloud.sdk.core;

/// An [AutonomicCell] represents a specific function in the autonomic system.
/// An [AutonomicComponent] fills up the cell with the actual implementation of
/// the function required. The cell merely acts as an interface to the underlying
/// component. This is bearing in mind that the [AutonomicComponent] can get
/// swapped out frequently during the system's execution.
abstract class AutonomicCell<I, O> extends AutonomicElement {
  final String cellLabel;
  final Observatory observatory;

  const AutonomicCell({
    required this.cellLabel,
    required this.observatory,
    required super.elementId,
    required super.systemId,
  });

  O run(I input) => component.action.call(input);

  AutonomicComponent<I, O> get component;
}

