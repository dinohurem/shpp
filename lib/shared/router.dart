// router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shpp/screens/admin/admin.dart';
import 'package:shpp/screens/admin/login.dart';
import 'package:shpp/screens/admin/project_details.dart';
import 'package:shpp/screens/admin/service_details.dart';
import 'package:shpp/screens/home.dart';
import 'package:shpp/screens/services_details.dart';
import 'package:shpp/screens/showcase_details.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const Home(),
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
      GoRoute(
        path: 'login',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Login(),
        ),
      ),
      GoRoute(
        path: 'admin',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Admin(),
        ),
        routes: [
          GoRoute(
            path: 'projects/:id', // Dynamic segment for project ID
            pageBuilder: (context, state) {
              // Extracting project ID from the route
              final id = state.pathParameters['id']!;
              return NoTransitionPage(
                child: ProjectDetails(projectId: id),
              );
            },
          ),
          GoRoute(
            path: 'services/:id', // Dynamic segment for service ID
            pageBuilder: (context, state) {
              // Extracting service ID from the route
              final id = state.pathParameters['id']!;
              return NoTransitionPage(
                child: ServiceDetails(serviceId: id),
              );
            },
          ),
        ],
      ),
    ])
  ],
);
