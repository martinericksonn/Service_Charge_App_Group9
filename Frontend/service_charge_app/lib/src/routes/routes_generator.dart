import 'package:flutter/material.dart';
import 'package:service_charge_app/src/routes/routes.dart';
import 'package:service_charge_app/src/screen/ticket_page.dart';
import 'package:service_charge_app/src/screen/user_page.dart';

import '../screen/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case routeTicket:
        return MaterialPageRoute(builder: (_) => TicketPage());
        break;
      case routeUser:
        return MaterialPageRoute(builder: (_) => UserPage());
        break;
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
