import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinuxMenuTile extends StatelessWidget {
  const LinuxMenuTile({
    super.key,
    required this.selected,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final bool selected;
  final IconData icon;
  final Function() onTap;
  final Widget? title;

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
        () => !isCompactLayout(context)
            ? ListTile(
                textColor: Theme.of(context).colorScheme.onSurface,
                selectedColor: Theme.of(context).colorScheme.onSurface,
                iconColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                leading: Icon(icon),
                title: !GlobalSettings.compactMode.value ? title : null,
                selected: selected,
                onTap: onTap,
              )
            : IconButton(onPressed: onTap, icon: Icon(icon)),
      ),
    );
  }
}
