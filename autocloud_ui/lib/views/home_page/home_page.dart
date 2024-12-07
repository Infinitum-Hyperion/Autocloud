part of autocloud.ui;

class AutocloudHomePage extends StatefulWidget {
  const AutocloudHomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => AutocloudHomePageState();
}

class AutocloudHomePageState extends PageScaffoldState<AutocloudHomePage> {
  AutocloudHomePageState() : super(pageId: PageViewId.home);
  @override
  Widget build(BuildContext context) {
    return const ACPGlobalScaffold(
      child: SizedBox(),
    );
  }
}
