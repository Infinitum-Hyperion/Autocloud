part of autocloud.sdk.workstation;

abstract class WorkstationComponent {
  final String sourceId;
  final AutocloudWorkstation workstation;

  const WorkstationComponent({
    required this.workstation,
    required String componentId,
  }) : sourceId = 'acp.workstation.component.$componentId';
}
