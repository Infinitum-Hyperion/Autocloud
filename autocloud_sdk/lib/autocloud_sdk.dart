library autocloud.sdk;

import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:markhor_sdk/markhor_sdk.dart';

part './organisation/entity_hierarchy.dart';
part './providers/key_value_db.dart';
part './providers/blob_db.dart';

enum ExecutionMode { debug, profile, release }

class AutocloudProject {
  static ExecutionMode executionMode = ExecutionMode.debug;
  final MarkhorConfigs markhorConfigs;
  final KeyValueDBProvider keyValueDBProvider;
  final BlobDBProvider blobDBProvider;
  final ExecutionState executionState = ExecutionState();

  AutocloudProject({
    required this.markhorConfigs,
    required this.keyValueDBProvider,
    required this.blobDBProvider,
  });

  ReplayBuffer<T> createReplayBuffer<T>(
    String id, {
    required T Function() call,
  }) {
    executionState.hasCreatedReplayBufferDoc = true;
    return ReplayBuffer(
      id,
      kvDBProvider: keyValueDBProvider,
      blobDBProvider: blobDBProvider,
      actualFunction: call,
    );
  }
}

class MarkhorConfigs {
  final Map<String, WidgetBuilder> liveTelemetryViewModes;

  const MarkhorConfigs({
    this.liveTelemetryViewModes = const {},
  });
}

class ExecutionState {
  bool hasCreatedReplayBufferDoc = false;
}
