library autocloud.sdk.cli;

import 'dart:async';
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import 'package:thp_autocloud/autocloud_sdk.dart';
import 'package:thp_markhor/markhor.dart';

part './commands.dart';

void main(List<String> args) {
  final CommandRunner commandRunner = CommandRunner('auto', "Autocloud CLI")
    ..addCommand(RunCommand());
  commandRunner.run(args);
}
