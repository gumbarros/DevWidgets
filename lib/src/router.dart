import 'package:dev_widgets/src/impl/layout/yaru/providers/is_drawer_open_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_group_provider.dart';
import 'package:dev_widgets/src/impl/layout/yaru/providers/selected_tool_provider.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/default_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'impl/layout/yaru/ui/yaru_layout.dart';

layout({required Widget child}) => ResponsiveWrapper.builder(
      YaruLayout(
        child: Consumer(
          builder: (context, ref, _) {
            final selectedTool = ref.watch(selectedToolProvider);
            final selectedGroup = ref.watch(selectedGroupProvider)?.name;
            final home = getToolByName("home");

            return Scaffold(
              appBar: DefaultAppBar(
                  title: selectedTool.name != "home"
                      ? selectedTool.fullTitle
                      : (selectedGroup ?? home.fullTitle)),
              drawer: const DefaultDrawer(),
              onDrawerChanged: (value) {
                ref.read(isDrawerOpenProvider.notifier).state = value;
              },
              body: child,
            );
          },
        ),
      ),
      breakpoints: [
        const ResponsiveBreakpoint.autoScale(360),
        const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
        const ResponsiveBreakpoint.resize(640, name: 'MOBILE_LARGE'),
        const ResponsiveBreakpoint.resize(850, name: TABLET),
        const ResponsiveBreakpoint.resize(920, name: 'TABLET_LARGE'),
        const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
        const ResponsiveBreakpoint.resize(1440, name: 'DESKTOP_LARGE'),
        const ResponsiveBreakpoint.resize(2460, name: '4K'),
      ],
    );

final GoRouter router = GoRouter(
    initialLocation: '/home', routes: [
  ShellRoute(routes: [
    for (final tool in allTools)
      GoRoute(
        path: tool.route,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            _buildPageWithDefaultTransition(
                context: context, state: state, child: tool.page),
      )
  ], builder: (context, state, child) => layout(child: child)),
]);

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
