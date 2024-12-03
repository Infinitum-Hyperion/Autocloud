part of autocloud.ui.ds;

class ACPGlobalScaffold extends StatelessWidget {
  final Widget child;

  const ACPGlobalScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: currentGlobalScaffoldKey,
        backgroundColor: ACPColor.blue,
        appBar: GlobalACPAppBar(),
        drawer: const GlobalACPDrawer(),
      ),
    );
  }
}
