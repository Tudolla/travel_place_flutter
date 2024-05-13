

import 'package:flutter/material.dart';
import 'package:traveloca/model/place.dart';
import 'package:traveloca/screens/place_detail.dart';

class PlaceList extends StatelessWidget {
  PlaceList({super.key, required this.placeList});

  List<Place> placeList;

  @override
  Widget build(BuildContext context) {
    if(placeList.isEmpty){
      return 
        Center(child: Text("Nothing places", style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,),),
      );
    
    }
    return ListView.builder(
      itemCount: placeList.length,
      itemBuilder: (ctx, index) => ListTile(
      title: Text(placeList[index].title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(ctx) => PlaceDetailScreen(place: placeList[index],),),);
      },
    ),
    );
  }
}