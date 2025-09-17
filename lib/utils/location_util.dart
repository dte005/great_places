import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? lat = 0.0,
    double? lng = 0.0,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=${dotenv.env['GOOGLE_MAPS_KEY']}';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${dotenv.env['GOOGLE_MAPS_KEY']}';
    final response = await get(Uri.parse(url));
    final responseDecoded = await json.decode(response.body);
    return responseDecoded['results'][0]['formatted_address'];
  }
}
