import 'package:devtoys/presentation/layout/landscape_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    required this.selected,
    required this.icon,
    required this.onTap,
    required this.title,
    this.padding,
  });

  final bool selected;
  final IconData icon;
  final Function() onTap;
  final Widget? title;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        color: selected
            ? Theme.of(context).colorScheme.onSurface.withOpacity(0.07)
            : null,
      ),
      child: Obx(
        () => !LandscapeLayout.compactMode.value
            ? Container(
                padding: padding ?? const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  textColor: Theme.of(context).colorScheme.onSurface,
                  selectedColor: Theme.of(context).colorScheme.onSurface,
                  iconColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  leading: FaIcon(
                    icon,
                    size: 18,
                  ),
                  title:
                      !LandscapeLayout.compactMode.value ? _buildTitle() : null,
                  selected: selected,
                  onTap: onTap,
                ),
              )
            : IconButton(onPressed: onTap, icon: FaIcon(icon)),
      ),
    );
  }

  Widget? _buildTitle() {
    if (title == null) {
      return title;
    }

    if (title is YaruPageItemTitle) {
      return DefaultTextStyle.merge(
        child: title!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return title;
  }
}
