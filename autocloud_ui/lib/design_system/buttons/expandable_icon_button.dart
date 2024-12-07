part of autocloud.ui.ds;

class ExpandableIconButton extends StatelessWidget {
  final ACPNavigationRailItemData itemData;
  final double width;
  final double height;
  final bool active;
  final bool expanded;
  final VoidCallback? notify;

  const ExpandableIconButton({
    required this.expanded,
    required this.active,
    required this.itemData,
    required this.width,
    required this.height,
    this.notify,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonPrimary =
        active ? ACPColor.purple : ACPColor.purple.withOpacity(0.3);
    return ACPButton(
      width: width,
      height: height,
      persistent: true,
      initialState: active ? ButtonState.active : ButtonState.inactive,
      action: () {
        itemData.action();
        notify?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              itemData.iconData,
              color: buttonPrimary,
              size: CONST.navigationRailIconSize,
            ),
            if (expanded) ...[
              const SizedBox(width: 17),
              Text(
                itemData.label,
                style: TextStyle(color: buttonPrimary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
