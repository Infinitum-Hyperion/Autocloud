part of autocloud.ui.ds;

class ACPNavigationMenu extends StatefulWidget {
  final double width;
  final double height;
  final List<ACPNavigationRailItemData> menuItems;
  final int activeIndex;

  const ACPNavigationMenu({
    required this.width,
    required this.height,
    required this.menuItems,
    required this.activeIndex,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => ACPNavigationMenuState();
}

class ACPNavigationMenuState extends State<ACPNavigationMenu> {
  late int activeIndex;

  @override
  void initState() {
    activeIndex = widget.activeIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ACPButton> buttons = [];
    for (int i = 0; i < widget.menuItems.length; i++) {
      final bool isActive = activeIndex == i;
      final Color primaryColor =
          isActive ? ACPColor.purple : ACPColor.purple.withOpacity(0.5);
      buttons.add(
        ACPButton(
          persistent: true,
          initialState: isActive ? ButtonState.active : ButtonState.inactive,
          width: widget.width,
          height: CONST.navigationRailWidth,
          action: () => setState(() {
            activeIndex = i;
            widget.menuItems[i].action();
          }),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  widget.menuItems[i].iconData,
                  size: CONST.navigationRailIconSize,
                  color: primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.menuItems[i].label,
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: ACPColor.blue,
          border: Border.all(color: ACPColor.white10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
