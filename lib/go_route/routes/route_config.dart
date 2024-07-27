import 'package:flutter/material.dart';
import 'package:flutter_provider/go_route/pages/about.dart';
import 'package:flutter_provider/go_route/pages/contact_us.dart';
import 'package:flutter_provider/go_route/pages/error_page.dart';
import 'package:flutter_provider/go_route/pages/home.dart';
import 'package:flutter_provider/go_route/pages/profile.dart';
import 'package:flutter_provider/go_route/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: MyAppRouteConstants.homeRoute,
        path: "/",
        pageBuilder: (context, state) {
          return const MaterialPage(child: Home());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.aboutRoute,
        path: "/about",
        pageBuilder: (context, state) {
          return const MaterialPage(child: About());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.contactUsRoute,
        path: "/contact_us",
        pageBuilder: (context, state) {
          return const MaterialPage(child: ContactUs());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.profileRoute,
        path: "/profile/:username/:userId",
        pageBuilder: (context, state) {
          return MaterialPage(
              child: Profile(
            username: state.pathParameters["username"]!,
            userId: state.pathParameters["userId"]!,
          ));
        },
      )
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
    redirect: (context, state) {
      var isAuth = false;
      print("${state.path}, ${state.fullPath}");
      if (!isAuth && !"/profile".startsWith("/profile")) {
        return context.namedLocation(MyAppRouteConstants.contactUsRoute);
      } else {
        return null;
      }
    },
  );
}
