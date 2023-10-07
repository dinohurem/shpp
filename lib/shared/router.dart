// router.dart
import 'package:go_router/go_router.dart';
import 'package:shpp/screens/about_details.dart';
import 'package:shpp/screens/home.dart';
import 'package:shpp/screens/services_details.dart';
import 'package:shpp/screens/showcase_details.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ShowcaseDetailsPage(),
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Home(), routes: [
      GoRoute(
        path: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        path: 'about',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        path: 'about-details',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AboutDetailsPage(),
        ), // Placeholder, replace with DetailsPage later
      ),
      GoRoute(
        path: 'services',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        path: 'services-details',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ServicesDetailsPage(),
        ),
      ),
      GoRoute(
        path: 'projects',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        path: 'projects-details',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ShowcaseDetailsPage(),
        ),
      ),
      GoRoute(
        path: 'news',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        path: 'news-details',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ShowcaseDetailsPage(),
        ),
      ),
      GoRoute(
        path: 'contact',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
    ])
  ],
);
