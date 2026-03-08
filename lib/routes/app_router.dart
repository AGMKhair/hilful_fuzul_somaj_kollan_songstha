import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/home.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/activities.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/routine.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/support/support_screen.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/profile/profile_screen.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/shared/widgets/main_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainWrapper(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/activities',
          builder: (context, state) => const ActivitiesScreen(),
        ),
        GoRoute(
          path: '/routine',
          builder: (context, state) => const RoutineScreen(),
        ),
        GoRoute(
          path: '/support',
          builder: (context, state) => const SupportScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
