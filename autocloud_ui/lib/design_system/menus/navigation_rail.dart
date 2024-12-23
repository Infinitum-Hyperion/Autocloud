part of autocloud.ui.ds;

class ACPNavigationRailItemData {
  final String label;
  final IconData iconData;
  final VoidCallback action;

  const ACPNavigationRailItemData({
    required this.label,
    required this.iconData,
    required this.action,
  });
}

class ACPNavigationRail extends StatefulWidget {
  final double closedWidth;
  final double expandedWidth;
  final double height;
  final List<ACPNavigationRailItemData> railItems;
  final int activeIndex;

  ACPNavigationRail({
    required this.closedWidth,
    required this.expandedWidth,
    required this.height,
    required this.railItems,
    required this.activeIndex,
  }) : super(key: ValueKey(railItems));

  @override
  State<StatefulWidget> createState() => ACPNavigationRailState();
}

class ACPNavigationRailState extends State<ACPNavigationRail> {
  late double width;
  late int activeIndex;

  @override
  void initState() {
    width = widget.closedWidth;
    activeIndex = widget.activeIndex;
    super.initState();
  }

  bool get isExpanded => width == widget.expandedWidth;

  @override
  Widget build(BuildContext context) {
    final List<ExpandableIconButton> buttons = [];
    for (int i = 0; i < widget.railItems.length; i++) {
      buttons.add(
        ExpandableIconButton(
          itemData: widget.railItems[i],
          active: i == activeIndex,
          width: width,
          height: widget.closedWidth,
          expanded: isExpanded,
          notify: () => setState(() {
            activeIndex = i;
          }),
        ),
      );
    }
    return MouseRegion(
      onEnter: (_) => setState(() {
        width = widget.expandedWidth;
      }),
      onExit: (_) => setState(() {
        width = widget.closedWidth;
      }),
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: width,
          height: widget.height,
          decoration: BoxDecoration(
            color: ACPColor.blue,
            border: Border.all(color: ACPColor.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
