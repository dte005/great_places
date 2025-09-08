import 'package:flutter/material.dart';
import 'package:great_places/pages/auth_pages/check_auth_page.dart';
import 'package:great_places/pages/places_form_page.dart';

class Routes {
  static String checkAuth = "/";
  static String placesForm = "/places/form";

  static Map<String, WidgetBuilder> routes = {
    Routes.checkAuth: (ctx) => CheckAuth(),
    Routes.placesForm: (ctx) => PlacesForm(),
  };
}
