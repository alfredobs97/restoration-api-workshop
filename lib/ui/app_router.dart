import 'package:flutter/material.dart';
import 'package:restoration_api_workshop/ui/pages/home/home_page.dart';
import 'package:restoration_api_workshop/ui/pages/onboarding/terms_page/terms_page.dart';
import 'package:restoration_api_workshop/ui/pages/onboarding/user_form/user_form_page.dart';

abstract class RouteNames {
  static const String home = '/home';
  static const String terms = '/terms';
  static const String userForm = '/user-form';
}

class AppRouter {
  static Route buildHomeRoute() => MaterialPageRoute(
        builder: (_) => const HomePage(),
      );
  static Route buildTermsPageRoute() => MaterialPageRoute(
        builder: (_) => const TermsPage(),
      );
  static Route buildUserFormPageRoute() => MaterialPageRoute(
        builder: (_) => const UserFormPage(),
      );

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.terms:
        return buildTermsPageRoute();
      case RouteNames.userForm:
        return buildUserFormPageRoute();
      case RouteNames.home:
      default:
        return buildHomeRoute();
    }
  }
}
