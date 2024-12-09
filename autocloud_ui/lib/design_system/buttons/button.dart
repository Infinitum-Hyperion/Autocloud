part of autocloud.ui.ds;

class ACPButton extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final bool persistent;
  final ButtonState initialState;
  final VoidCallback action;

  const ACPButton({
    required this.width,
    required this.height,
    required this.persistent,
    required this.action,
    this.initialState = ButtonState.inactive,
    required this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => ACPButtonState();
}

class ACPButtonState extends State<ACPButton> {
  late ButtonState currentState;
  bool didPress = false;

  @override
  void initState() {
    currentState = widget.initialState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: switch (currentState) {
            ButtonState.active => ACPColor.purple.withOpacity(0.1),
            ButtonState.hovered => ACPColor.purple.withOpacity(0.1),
            ButtonState() => Colors.transparent,
          },
          border: (widget.persistent && (currentState == ButtonState.active))
              ? const Border(
                  right: BorderSide(
                    color: ACPColor.purple,
                  ),
                )
              : null,
        ),
        child: GestureDetector(
          onTap: () => setState(() {
            didPress = true;
            currentState = currentState == ButtonState.active
                ? ButtonState.inactive
                : ButtonState.active;
            widget.action();
          }),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() {
              if (currentState != ButtonState.active) {
                currentState = ButtonState.hovered;
              }
            }),
            onExit: (_) => setState(() {
              if (!didPress && currentState != ButtonState.active) {
                currentState = ButtonState.inactive;
              }
              didPress = false;
            }),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
/**
 * 
 */