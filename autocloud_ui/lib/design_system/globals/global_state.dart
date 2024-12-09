part of autocloud.ui.ds;

class GlobalState {
  static const List<PageMeta> pages = [
    PageMeta(
      iconData: Icons.home,
      id: PageViewId.autocloud,
      label: 'Autocloud',
      views: [
        ViewMeta(
          iconData: Icons.abc,
          viewId: PageViewId.ac_home,
          label: 'Home',
        ),
      ],
    ),
    PageMeta(
      iconData: Icons.apps,
      id: PageViewId.markhor,
      label: 'Markhor',
      views: [
        ViewMeta(
          iconData: Icons.troubleshoot,
          viewId: PageViewId.mk_liveTelemetry,
          label: 'Live Telemetry',
        ),
        ViewMeta(
          iconData: Icons.display_settings,
          viewId: PageViewId.mk_workstation,
          label: 'Workstation',
        ),
      ],
    ),
  ];

  static PageViewId pageId = PageViewId.markhor;
  static PageViewId viewId = PageViewId.mk_workstation;
  static int get currentPageIndex => switch (GlobalState.pageId) {
        PageViewId.autocloud => 0,
        PageViewId.markhor => 1,
        PageViewId() => 0,
      };

  static int get currentViewIndex =>
      pages[currentPageIndex].views.indexWhere((viewMeta) =>
          viewMeta.id(pages[currentPageIndex]) == "$pageId${viewId.id}");
}

class CONST {
  static const double navigationRailWidth = 63;
  static const double globalAppBarHeight = navigationRailWidth;
  static const double navigationRailIconSize = 28;
}
