// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appShellRouteData];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/games', factory: $GamesRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/yaku',
          factory: $YakuListRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              factory: $YakuDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $GamesRoute on GoRouteData {
  static GamesRoute _fromState(GoRouterState state) => const GamesRoute();

  @override
  String get location => GoRouteData.$location('/games');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $YakuListRoute on GoRouteData {
  static YakuListRoute _fromState(GoRouterState state) => const YakuListRoute();

  @override
  String get location => GoRouteData.$location('/yaku');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $YakuDetailRoute on GoRouteData {
  static YakuDetailRoute _fromState(GoRouterState state) =>
      YakuDetailRoute(id: state.pathParameters['id']!);

  YakuDetailRoute get _self => this as YakuDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/yaku/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
