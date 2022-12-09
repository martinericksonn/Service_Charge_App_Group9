import 'package:flutter/material.dart';
import 'package:service_charge_app/src/entity/user/user.dart';
import 'package:service_charge_app/src/routes/routes.dart';
import 'package:service_charge_app/src/screen/app_view.dart';
import 'package:service_charge_app/src/screen/login_page.dart';
import 'package:service_charge_app/src/screen/dashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case routeAppView:
        return MaterialPageRoute(
            builder: (_) => AppView(
                  user: User(),
                ));

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
