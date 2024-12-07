part of autocloud.ui.ds;

enum PageViewId {
  home('/home'),
  overview('/overview'),
  liveTelemetry('/live_telemetry'),
  workstation('/workstation'),
  markhor('/markhor');

  final String id;
  const PageViewId(this.id);
}

class GlobalState {
  static PageViewId pageId = PageViewId.home;
  static PageViewId viewId = PageViewId.overview;
}

class CONST {
  static const double navigationRailWidth = 63;
  static const double globalAppBarHeight = navigationRailWidth;
  static const double navigationRailIconSize = 28;
}
