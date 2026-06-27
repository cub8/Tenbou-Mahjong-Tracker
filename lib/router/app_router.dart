import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tenbou_mahjong/features/app_shell/presentation/widgets/main_shell.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/pages/end_round_page.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/pages/game_detail_page.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/pages/game_list_page.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/pages/yaku_list_page.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/pages/yaku_page.dart';

part 'app_router.g.dart';

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: [
    TypedStatefulShellBranch<GamesBranchData>(
      routes: [
        TypedGoRoute<GamesRoute>(
          path: '/games',
          routes: [
            TypedGoRoute<GameDetailRoute>(
              path: ':id',
              routes: [
                TypedGoRoute<EndRoundRoute>(path: 'end-round'),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<YakuBranchData>(
      routes: [
        TypedGoRoute<YakuListRoute>(
          path: '/yaku',
          routes: [
            TypedGoRoute<YakuDetailRoute>(path: ':id'),
          ],
        ),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      MainShell(navigationShell: navigationShell);
}

class GamesBranchData extends StatefulShellBranchData {
  const GamesBranchData();
}

class YakuBranchData extends StatefulShellBranchData {
  const YakuBranchData();
}

class GamesRoute extends GoRouteData with $GamesRoute {
  const GamesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GameListPage();
}

class GameDetailRoute extends GoRouteData with $GameDetailRoute {
  const GameDetailRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GameDetailPage(gameId: int.parse(id));
}

class EndRoundRoute extends GoRouteData with $EndRoundRoute {
  const EndRoundRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EndRoundPage(gameId: int.parse(id));
}

class YakuListRoute extends GoRouteData with $YakuListRoute {
  const YakuListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const YakuListPage();
}

class YakuDetailRoute extends GoRouteData with $YakuDetailRoute {
  const YakuDetailRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) => YakuPage(id: id);
}

final appRouter = GoRouter(
  initialLocation: '/games',
  routes: $appRoutes,
);
