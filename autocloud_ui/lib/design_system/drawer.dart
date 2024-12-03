part of autocloud.ui.ds;

class ACPDrawerItemData {
  final IconData icon;
  final String title;
  final VoidCallback action;

  const ACPDrawerItemData({
    required this.icon,
    required this.title,
    required this.action,
  });
}

class ACPDrawer extends StatelessWidget {
  final double width;
  final double height;
  final List<ACPDrawerItemData> drawerItems;

  const ACPDrawer({
    required this.width,
    required this.height,
    required this.drawerItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: ACPColor.blue,
      child: Column(
        children: [
          const SizedBox(
            height: 80,
            child: Text('AutoCloud'),
          ),
          const Divider(),
          SingleChildScrollView(
            child: Column(
              children: [
                for (final item in drawerItems)
                  ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    onTap: () => item.action(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
