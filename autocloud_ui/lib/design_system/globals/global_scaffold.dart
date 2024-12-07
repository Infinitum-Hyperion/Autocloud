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
      color: ACPColor.blue,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 63,
            right: 0,
            child: Column(
              children: [
                const GlobalACPAppBar(),
                child,
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            child: GlobalACPNavigationRail(),
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
    super.initState();
  }
}
