import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location? pickLocation;
  var _isGetLocation = false;
  void getCurrentLocation() async {
    Location location =  Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState((){
    _isGetLocation = true;

    });

    _locationData = await location.getLocation();

    setState((){

    _isGetLocation = false;
    });

    print(_locationData.latitude);
    print(_locationData.longitude);



  }

  @override
  Widget build(BuildContext context) {

    Widget previewContent = Text(
            "No place is selected",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          );
          if(_isGetLocation == false){
            previewContent = CircularProgressIndicator();
          }
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text("Get your Location"),
              onPressed: getCurrentLocation,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text("Switch Google Map"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
