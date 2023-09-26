part of autocloud.sdk.core;

/// An [AutonomicCell] represents a specific function in the autonomic system.
/// An [AutonomicComponent] fills up the cell with the actual implementation of
/// the function required. The cell merely acts as an interface to the underlying
/// component. This is bearing in mind that the [AutonomicComponent] can get
/// swapped out frequently during the system's execution.
abstract class AutonomicMotorCell<I, O> extends AutonomicCell with Logging {
  final String cellLabel;

  const AutonomicMotorCell({
    required this.cellLabel,
    required super.observatory,
    required super.elementId,
    required super.systemId,
  });

  O run(I input) {
    observatory.contextMonitor.setContext(this);
    final ExecutionSpan span = ExecutionSpan(cell: this);
    try {
      final O output = component.action.call(input);
      return output;
    } catch (e) {
      rethrow;
    } finally {
      observatory.contextMonitor.logSpan(span);
      observatory.contextMonitor.endContext();
    }
  }

  AutonomicComponent<I, O> get component;
}
