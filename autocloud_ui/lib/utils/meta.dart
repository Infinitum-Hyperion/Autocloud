library autocloud.ui.utils;

import 'package:flutter/material.dart';

enum PageViewId {
  autocloud('/autocloud'),
  ac_home('/home'),
  mk_liveTelemetry('/live_telemetry'),
  mk_workstation('/workstation'),
  markhor('/markhor');

  final String id;
  const PageViewId(this.id);
}

class PageMeta {
  final PageViewId id;
  final IconData iconData;
  final String label;
  final List<ViewMeta> views;

  const PageMeta({
    required this.iconData,
    required this.id,
    required this.label,
    required this.views,
  });
}

class ViewMeta {
  final PageViewId viewId;
  final IconData iconData;
  final String label;

  const ViewMeta({
    required this.iconData,
    required this.viewId,
    required this.label,
  });

  String id(PageMeta parent) => "${parent.id.id}${viewId.id}";
}
