import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_agro/core/get_it/service_locator.dart';
import 'package:smart_agro/core/pages/bottom_bar_page.dart';
import 'package:smart_agro/core/pages/landing_page.dart';
import 'package:smart_agro/core/pages/language_selection_page.dart';
import 'package:smart_agro/features/auth/presentation/pages/login_page.dart';
import 'package:smart_agro/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/crop_selector.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/dashboard_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/farm_details_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Approuter {
  static final Approuter _instance = Approuter.init();

  static final instance = _instance;
  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> dashboardTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> cropSelectorTabNavigatorKey =
      GlobalKey<NavigatorState>();

  Approuter.init() {
    final List<RouteBase> routes = <RouteBase>[
      GoRoute(
        path: LanguageSelectionPage.routePath,
        name: LanguageSelectionPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const LanguageSelectionPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: LoginPage.routePath,
        name: LoginPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const LoginPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: LandingPage.routePath,
        name: LandingPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const LandingPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: OtpVerificationPage.routePath,
        name: OtpVerificationPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const OtpVerificationPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: FarmDetailsPage.routePath,
        name: FarmDetailsPage.routeName,
        pageBuilder: (context, state) =>
            getPage(child: const FarmDetailsPage(), state: state),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        pageBuilder: (context, state, navigationShell) => getPage(
          child: BottomBarPage(shell: navigationShell),
          state: state,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: DashboardPage.routePath,
                name: DashboardPage.routeName,
                pageBuilder: (context, state) =>
                    getPage(child: const DashboardPage(), state: state),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: dashboardTabNavigatorKey,
            routes: [
              GoRoute(
                path: CropSelector.routePath,
                name: CropSelector.routeName,
                pageBuilder: (context, state) =>
                    getPage(child: const CropSelector(), state: state),
              ),
            ],
          ),
        ],
      )
    ];
    router = GoRouter(
      initialLocation: LanguageSelectionPage.routePath,
      navigatorKey: parentNavigatorKey,
      routes: routes,
      redirect: redirect,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  FutureOr<String?> redirect(BuildContext ct, GoRouterState state) async {
    final User? user = locator<SupabaseClient>().auth.currentUser;
    final bool isLoggedIn = user != null;

    if ((state.matchedLocation == LoginPage.routePath ||
            state.matchedLocation == LanguageSelectionPage.routePath) &&
        isLoggedIn) {
      return DashboardPage.routePath;
    }
    return null;
  }
}

extension GoRouterExtension on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }

  Stream<String> get locationStream => Stream<String>.periodic(
        const Duration(seconds: 1),
        (computationCount) {
          return Approuter.router.location;
        },
      );
}
