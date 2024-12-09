part of autocloud.ui.ds;

class ACPGlobalScaffold extends StatefulWidget {
  final Widget child;

  const ACPGlobalScaffold({
    required this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => ACPGlobalScaffoldState();
}

class ACPGlobalScaffoldState extends State<ACPGlobalScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ACPColor.blue,
      appBar: AppBar(
        backgroundColor: ACPColor.blue,
        leading: Builder(
          builder: (ctx) => ACPButton(
            width: CONST.navigationRailWidth,
            height: CONST.globalAppBarHeight,
            persistent: false,
            action: () {
              Scaffold.of(ctx).openDrawer();
            },
            child: const Icon(
              Icons.home,
              color: ACPColor.cyan,
            ),
          ),
        ),
        title: Text(
          GlobalState.pages[GlobalState.currentPageIndex].label,
          style: const TextStyle(color: ACPColor.cyan),
        ),
        centerTitle: false,
      ),
      drawer: ACPNavigationMenu(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height,
        menuItems: [
          for (final pageMeta in GlobalState.pages)
            ACPNavigationRailItemData(
              iconData: pageMeta.iconData,
              label: pageMeta.label,
              action: () => Navigator.of(context)
                  .pushNamed(pageMeta.views[0].id(pageMeta)),
            ),
        ],
        activeIndex: GlobalState.currentPageIndex,
      ),
      body: Stack(
        children: [
          Positioned(
            top: CONST.globalAppBarHeight,
            left: CONST.navigationRailWidth,
            child: widget.child,
          ),
          Positioned(
            child: ACPNavigationRail(
              closedWidth: CONST.navigationRailWidth,
              expandedWidth: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height,
              railItems: [
                for (final viewMeta
                    in GlobalState.pages[GlobalState.currentPageIndex].views)
                  ACPNavigationRailItemData(
                    iconData: viewMeta.iconData,
                    label: viewMeta.label,
                    action: () => Navigator.of(context).pushNamed(viewMeta
                        .id(GlobalState.pages[GlobalState.currentPageIndex])),
                  ),
              ],
              activeIndex: GlobalState.currentViewIndex,
            ),
          ),
        ],
      ),
    );
  }
}

abstract class PageScaffoldState<T extends StatefulWidget> extends State<T> {
  final PageViewId pageId;
  PageScaffoldState({required this.pageId});

  @override
  void initState() {
    GlobalState.pageId = pageId;
    super.initState();
  }
}

abstract class ViewScaffoldState<T extends StatefulWidget> extends State<T> {
  final PageViewId viewId;
  ViewScaffoldState({required this.viewId});

  @override
  void initState() {
    GlobalState.viewId = viewId;
    print('set');
    super.initState();
  }
}
