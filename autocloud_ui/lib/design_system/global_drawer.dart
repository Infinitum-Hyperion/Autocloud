part of autocloud.ui.ds;

class GlobalACPDrawer extends StatelessWidget {
  const GlobalACPDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ACPDrawer(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      drawerItems: [
        ACPDrawerItemData(
          icon: Icons.troubleshoot,
          title: 'Markhor',
          action: () => Navigator.of(context).pushNamed('/markhor'),
        )
      ],
    );
  }
}
