import 'package:flutter/material.dart';
import 'package:great_places/pages/auth_pages/check_auth_page.dart';
import 'package:great_places/pages/places_detail_page.dart';
import 'package:great_places/pages/places_form_page.dart';

class Routes {
  static String checkAuth = "/";
  static String placeForm = "/place/form";
  static String placeDetail = "/place/detail";

  static Map<String, WidgetBuilder> routes = {
    Routes.checkAuth: (ctx) => CheckAuth(),
    Routes.placeForm: (ctx) => PlaceForm(),
    Routes.placeDetail: (ctx) => PlaceDetail(),
  };
}
