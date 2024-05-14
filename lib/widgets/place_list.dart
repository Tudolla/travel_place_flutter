

import 'package:flutter/material.dart';
import 'package:traveloca/model/place.dart';
import 'package:traveloca/screens/place_detail.dart';


class PlaceList extends StatefulWidget {
  PlaceList({super.key, required this.placeList});

  final List<Place> placeList;

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  @override
  Widget build(BuildContext context) {
    if(widget.placeList.isEmpty){
      return 
        Center(child: Text("Nothing places", style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,),),
      );
    
    }
    return ListView.builder(
      itemCount: widget.placeList.length,
      itemBuilder: (ctx, index) => ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: FileImage(widget.placeList[index].image),
      ) ,
      title: Text(widget.placeList[index].title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(ctx) => PlaceDetailScreen(place: widget.placeList[index],),),);
      },
    ),
    );
  }
}