library autocloud.sdk.workstation;

import 'dart:async';
import 'package:thp_markhor/markhor.dart';

import 'dart:io';

part './workstation_component.dart';
part './workstation_agent.dart';
part './workstation_node.dart';
part './datahouse/datahouse.dart';

class AutocloudWorkstation {
  /// A benefit of using a [AutocloudWorkstation] is that it can initialise all the
  /// components for you. If you create [WorkstationComponent]s without providing
  /// an overall workstation, you'll have to figure out the async initialisers for
  /// each component and await them individually.
  final List<Future> asyncInitialisations = [];
  late final Observatory observatory;
  final List<WorkstationNode> nodes = [];
  final List<WorkstationAgent> agents = [];

  Future<void> initAsyncComponents() async =>
      await Future.wait(asyncInitialisations);
}
