part of autocloud.ui.ds;

mixin PaneStyling {
  Widget paneStyle({
    required String title,
    required Color primaryColor,
    required double width,
    required Widget child,
    List<Widget> actionItems = const [],
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ACPColor.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 40,
            decoration:
                BoxDecoration(border: Border.all(color: ACPColor.white10)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: ACPFont.paneTitle(
                  TextStyle(color: primaryColor),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
