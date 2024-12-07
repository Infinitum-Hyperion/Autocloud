part of autocloud.ui.ds;

class GlobalACPNavigationRail extends StatelessWidget {
  const GlobalACPNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return ACPNavigationRail(
      closedWidth: CONST.navigationRailWidth,
      expandedWidth: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      activeIndex: switch (GlobalState.pageId) {
        PageViewId.home => 0,
        PageViewId.markhor => 1,
        PageViewId() => 0,
      },
      railItems: [
        ACPNavigationRailItemData(
          iconData: Icons.troubleshoot,
          label: 'Home',
          action: () => Navigator.of(context).pushNamed(PageViewId.home.id),
        ),
        ACPNavigationRailItemData(
          iconData: Icons.troubleshoot,
          label: 'Markhor',
          action: () => Navigator.of(context).pushNamed(PageViewId.markhor.id),
        ),
      ],
    );
  }
}
