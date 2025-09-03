import 'package:flutter/material.dart';
import 'package:great_places/pages/error_page.dart';
import 'package:great_places/pages/places_list_page.dart';
import 'package:great_places/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return FutureBuilder(
      future: authProvider.autoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return ErrorPage(errorMessage: snapshot.error.toString());
        } else {
          return authProvider.isAuth ? PlacesList() : Login();
        }
      },
    );
  }
}
