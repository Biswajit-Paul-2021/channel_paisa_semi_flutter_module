import 'package:flutter/material.dart';

/// View Status Widget
class ViewStatus extends StatelessWidget {
  /// View Status Widget
  const ViewStatus({
    @required this.selectedIndex,
    @required this.onTap,
    @required this.childList,
    this.activeColor,
    this.inactiveColor,
    this.activeStyle,
    this.inactiveStyle,
  });

  /// Selected Index
  final int selectedIndex;

  /// On Tap funtcion
  final void Function(int pos) onTap;

  /// List of child Widget
  final List<StatusItem> childList;

  ///Active Title Text Style
  final TextStyle activeStyle;

  ///Inactive Title Text Style
  final TextStyle inactiveStyle;

  /// Selected Border Color
  final Color activeColor;

  /// Not Selected Color
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemBuilder: (ctx, pos) => _StatusItemWidget(
          key: ValueKey(pos),
          onTap: onTap,
          pos: pos,
          selectedIndex: selectedIndex,
          child: childList[pos],
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          inactiveStyle: inactiveStyle,
          activeStyle: activeStyle,
        ),
        separatorBuilder: (ctx, pos) => const SizedBox(
          width: 8,
        ),
        itemCount: childList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

/// Status Item
class StatusItem {
  /// Status Item
  StatusItem({@required this.child, @required this.title});

  /// Child Widget
  final Widget child;

  /// Title
  final String title;
}

/// Status Item
class _StatusItemWidget extends StatelessWidget {
  /// Status Item
  const _StatusItemWidget({
    Key key,
    @required this.onTap,
    @required this.pos,
    @required this.child,
    @required this.selectedIndex,
    this.activeColor,
    this.inactiveColor,
    this.activeStyle,
    this.inactiveStyle,
  }) : super(key: key);

  /// On Tap funtcion
  final void Function(int pos) onTap;

  /// Pos
  final int pos;

  /// child
  final StatusItem child;

  /// Selected Index
  final int selectedIndex;

  /// Selected Border Color
  final Color activeColor;

  /// Not Selected Color
  final Color inactiveColor;

  ///Active Title Text Style
  final TextStyle activeStyle;

  ///Inactive Title Text Style
  final TextStyle inactiveStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => onTap(pos),
          child: SizedBox(
            width: 80,
            height: 80,
            child: Container(
              // padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == pos
                      ? activeColor ?? Theme.of(context).primaryColor
                      : inactiveColor ?? Colors.transparent,
                  width: 2.5,
                ),
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: child.child,
              ),
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            child.title,
            style: selectedIndex == pos
                ? activeStyle ?? TextStyle(fontWeight: FontWeight.bold)
                : inactiveStyle,
          ),
        ),
      ],
    );
  }
}
