import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:knowyourdonor/models/Place.dart';

// const kGoogleApiKey = API_KEY;
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: "");

class Location {
  Future<Place> predictionScreen(BuildContext context) async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: "",
      onError: onError,
      mode: Mode.fullscreen,
      language: "eng",
      components: [Component(Component.country, "ind")],
    );
    return displayPrediction(p);
  }

  Future<Place> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      var lat = detail.result.geometry.location.lat;
      var long = detail.result.geometry.location.lng;

      var address = detail.result.formattedAddress;

      Place place = Place(placeId, address, lat, long);

      print("Lat " + lat.toString());
      print("Long " + long.toString());
      print(address);

      return place;
    }

    return null;
  }

  void onError(PlacesAutocompleteResponse response) {
    print('${response.errorMessage}');
  }
}
