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
      key: ValueKey(GlobalState.currentPageIndex),
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
          style: ACPFont.pageTitle(const TextStyle(color: ACPColor.cyan)),
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
              action: () => setState(() {
                Navigator.of(context).pushNamed(pageMeta.views[0].id(pageMeta));
              }),
            ),
        ],
        activeIndex: GlobalState.currentPageIndex,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: CONST.navigationRailWidth,
            right: 0,
            bottom: 0,
            child: widget.child,
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
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
                    action: () => setState(() {
                      Navigator.of(context).pushNamed(viewMeta
                          .id(GlobalState.pages[GlobalState.currentPageIndex]));
                    }),
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

abstract class ViewScaffoldState<T extends StatefulWidget> extends State<T> {
  final PageViewId pageId;

  final PageViewId viewId;

  ViewScaffoldState({
    required this.pageId,
    required this.viewId,
  });

  @override
  void initState() {
    GlobalState.pageId = pageId;
    GlobalState.viewId = viewId;
    super.initState();
  }
}
