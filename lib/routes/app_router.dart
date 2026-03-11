import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/screen/goals.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/screen/home.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/model/project_hiligts.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/screen/karjokrom/activities.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/screen/project/project_details_screen.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/screen/routine.dart';
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
        GoRoute(
          path: '/goals',
          builder: (context, state) => const GoalsScreen(),
        ),
        GoRoute(
          path: '/project/:id',
          builder: (context, state) {
            final extra = state.extra;
            if (extra == null || extra is! ProjectHighlight) {
              // extra না পেলে fallback screen
              return const Scaffold(body: Center(child: Text('ডাটা পাওয়া যায়নি')));
            }
            return ProjectDetailsScreen(project: extra);
          },
        ),
      ],
    ),
  ],
);
