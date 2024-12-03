part of autocloud.ui.ds;

class GlobalACPAppBar extends AppBar {
  GlobalACPAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ACPColor.blue,
      leading: IconButton(
        onPressed: () {
          currentGlobalScaffoldKey.currentState!.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      title: const Text('AutoCloud'),
    );
  }
}
