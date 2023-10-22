part of autocloud.sdk.cli;

class RunCommand extends Command<Process> {
  @override
  final String name = 'run';
  @override
  final String description = 'Run an autocloud project';
  @override
  final ArgParser argParser = ArgParser()
    ..addFlag(
      'workstation',
      help: "Launch a Workstation instance",
      negatable: false,
    );

  @override
  Future<Process> run() async {
    return await Process.start(
      'flutter',
      ['run', '-d', 'chrome'],
      workingDirectory: currentDir.path,
      runInShell: true,
    );
  }
}

class StopCommand extends Command {
  @override
  final String name = 'stop';
  @override
  final String description = 'Stop a running autocloud project';
  @override
  final ArgParser argParser = ArgParser()
    ..addFlag(
      'workstation',
      help: "Shut down the attached Workstation instance",
      negatable: false,
    );

  @override
  FutureOr? run() async {
    return await Process.start(
      'flutter',
      ['run', '-d', 'chrome'],
      workingDirectory: currentDir.path,
      runInShell: true,
    );
  }
}
