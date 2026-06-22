import 'package:go_router/go_router.dart';
import 'package:tenbou_mahjong/features/app_shell/presentation/widgets/main_shell.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/pages/game_session_index_page.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/pages/yaku_list_page.dart';
import 'package:tenbou_mahjong/features/yaku/presentation/pages/yaku_page.dart';

final appRouter = GoRouter(
  initialLocation: '/games',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/games',
              builder: (context, state) => const GameSessionIndexPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/yaku',
              builder: (context, state) => const YakuListPage(),
              routes: [
                GoRoute(
                  path: ":id",
                  builder: (context, state) {
                    final id = state.pathParameters["id"]!;
                    return YakuPage(id: id);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
