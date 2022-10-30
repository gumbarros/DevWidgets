import 'package:dev_widgets/src/impl/layout/yaru/providers/compact_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YaruMenuTile extends StatelessWidget {
  const YaruMenuTile({
    super.key,
    required this.selected,
    required this.icon,
    this.onTap,
    required this.title,
  });

  final bool selected;
  final IconData icon;
  final Function()? onTap;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          color: selected
              ? Theme.of(context).colorScheme.onSurface.withOpacity(0.07)
              : null,
        ),
        child: Consumer(
            builder: (context, ref, child) => !ref.watch(isCompactModeProvider)
                ? ListTile(
                    textColor: Theme.of(context).colorScheme.onSurface,
                    selectedColor: Theme.of(context).colorScheme.onSurface,
                    iconColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    leading: Icon(icon),
                    title: Consumer(
                      builder: (context, ref, _) {
                        bool compactMode = ref.watch(isCompactModeProvider);
                        return !compactMode ? title : const SizedBox.shrink();
                      },
                    ),
                    selected: selected,
                    onTap: onTap,
                  )
                : IconButton(onPressed: onTap, icon: Icon(icon))));
  }
}
