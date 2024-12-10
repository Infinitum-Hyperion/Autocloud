part of autocloud.ui;

class AutocloudHomePage extends StatefulWidget {
  const AutocloudHomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => AutocloudHomePageState();
}

class AutocloudHomePageState extends ViewScaffoldState<AutocloudHomePage> {
  AutocloudHomePageState()
      : super(
          pageId: PageViewId.autocloud,
          viewId: PageViewId.ac_home,
        );
  @override
  Widget build(BuildContext context) {
    return const ACPGlobalScaffold(
      child: SizedBox(),
    );
  }
}
