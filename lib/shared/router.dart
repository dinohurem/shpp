// router.dart
import 'package:go_router/go_router.dart';
import 'package:shpp/screens/admin/admin.dart';
import 'package:shpp/screens/admin/login.dart';
import 'package:shpp/screens/admin/project_details.dart';
import 'package:shpp/screens/admin/service_details.dart';
import 'package:shpp/screens/home.dart';
import 'package:shpp/screens/services_details.dart';
import 'package:shpp/screens/showcase/showcase_details.dart';

enum AppRouteNames {
  home,
  about,
  services,
  servicesDetails,
  projects,
  projectsDetails,
  news,
  contact,
  login,
  admin,
  adminProjects,
  adminServices,
  projectDetails,
  serviceDetails,
}

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const Home(),
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Home(), routes: [
      GoRoute(
        name: AppRouteNames.home.name,
        path: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.about.name,
        path: 'about',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.services.name,
        path: 'services',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.servicesDetails.name,
        path: 'services-details',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ServicesDetailsPage(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.projects.name,
        path: 'projects',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.projectsDetails.name,
        path: 'projects-details',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ShowcaseDetails(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.news.name,
        path: 'news',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.contact.name,
        path: 'contact',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Home(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.login.name,
        path: 'login',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Login(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.admin.name,
        path: 'admin',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Admin(),
        ),
        routes: [
          GoRoute(
            name: AppRouteNames.adminProjects.name,
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
            name: AppRouteNames.adminServices.name,
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
