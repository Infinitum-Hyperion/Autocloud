part of autocloud.sdk.core;

class SystemGoals extends AutonomicElement with Storable<JSON> {
  final List<ServiceLevelAgreement> agreements;

  const SystemGoals({
    required this.agreements,
    required super.elementId,
    required super.systemId,
  });

  factory SystemGoals.fromStorable(Object? storable) {
    final JSON json = storable as JSON;
    return SystemGoals(
      agreements: json
          .getList('agreements')
          .listOf((e) => ServiceLevelAgreement.fromStorable(e)),
      elementId: json.get<String>('elementId'),
      systemId: json.get<String>('systemId'),
    );
  }

  @override
  JSON serialize() => {
        'agreements': agreements.toStorableList(),
        'elementId': elementId,
        'systemId': systemId,
      };
}

class ServiceLevelAgreement extends AutonomicElement with Storable<JSON> {
  final String description;
  final List<ServiceLevelObjective> objectives;

  const ServiceLevelAgreement({
    required this.description,
    required this.objectives,
    required super.elementId,
    required super.systemId,
  });

  factory ServiceLevelAgreement.fromStorable(Object? storable) {
    final JSON json = storable as JSON;
    return ServiceLevelAgreement(
      description: json.get<String>('description'),
      objectives: json
          .getList('objectives')
          .listOf((e) => ServiceLevelObjective.fromStorable(e)),
      elementId: json.get<String>('elementId'),
      systemId: json.get<String>('systemId'),
    );
  }

  @override
  JSON serialize() => {
        'objectives': objectives.toStorableList(),
        'description': description,
        'elementId': elementId,
        'systemId': systemId,
      };
}

class ServiceLevelObjective extends AutonomicElement with Storable<JSON> {
  final SystemParameter systemParameter;
  final dynamic targetValue;

  const ServiceLevelObjective({
    required this.systemParameter,
    required this.targetValue,
    required super.elementId,
    required super.systemId,
  });

  factory ServiceLevelObjective.fromStorable(Object? storable) {
    final JSON json = storable as JSON;
    return ServiceLevelObjective(
      systemParameter:
          SystemParameter.fromStorable(json.get<JSON>('systemParameter')),
      targetValue: json.get<dynamic>('targetValue'),
      elementId: json.get<String>('elementId'),
      systemId: json.get<String>('systemId'),
    );
  }

  @override
  JSON serialize() => {
        'systemParameter': systemParameter.serialize(),
        'targetValue': targetValue,
        'elementId': elementId,
        'systemId': systemId,
      };
}

class SystemParameter extends AutonomicElement implements Storable<JSON> {
  final String featureId;

  const SystemParameter({
    required this.featureId,
    required super.elementId,
    required super.systemId,
  });

  factory SystemParameter.fromStorable(Object? storable) {
    final JSON json = storable as JSON;
    return SystemParameter(
      featureId: json.get<String>('featureId'),
      elementId: json.get<String>('elementId'),
      systemId: json.get<String>('systemId'),
    );
  }

  @override
  JSON serialize() => {
        'featureId': featureId,
        'elementId': elementId,
        'systemId': systemId,
      };
}
