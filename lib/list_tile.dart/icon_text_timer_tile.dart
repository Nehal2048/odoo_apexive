import 'package:flutter/widgets.dart';
import 'package:odoo_apexive/shared/const.dart';
import 'package:odoo_apexive/shared/theme.dart';

class IconTextTimerTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final TextStyle? style;

  const IconTextTimerTile({
    super.key,
    required this.iconData,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          iconData,
        ),
        const SizedBox(
          width: defaultGap,
        ),
        Expanded(
          child: Text(
            text,
            style: style ??
                themeDataLight.textTheme.bodyMedium!.copyWith(
                  height: 0,
                ),
          ),
        ),
      ],
    );
  }
}
