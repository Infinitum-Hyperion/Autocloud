part of autocloud.ui.ds;

class GlobalACPAppBar extends StatelessWidget {
  const GlobalACPAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ACPColor.blue,
        border: Border.all(color: ACPColor.white10),
      ),
      child: const Row(
        children: [
          SizedBox(height: CONST.globalAppBarHeight),
          Text(
            'Autocloud',
            style: TextStyle(color: ACPColor.cyan),
          )
        ],
      ),
    );
  }
}
