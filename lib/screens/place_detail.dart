import 'package:flutter/material.dart';
import 'package:traveloca/model/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ),
      
      body: Stack(
        children: [
          Image.file(place.image,
          fit: BoxFit.cover,
          height: 500,
          width: double.infinity,),
                 ],
      ),
    );
  }
}