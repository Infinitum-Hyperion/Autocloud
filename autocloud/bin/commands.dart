part of autocloud.sdk.cli;

class RunCommand extends Command {
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
  FutureOr? run() {
    print("Launching...");
  }
}
