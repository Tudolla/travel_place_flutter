import 'package:flutter/material.dart';
import 'package:traveloca/screens/add_place.dart';
import 'package:traveloca/widgets/place_list.dart';

class FlacesScreen extends StatelessWidget {
  const FlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddPlace()));
          }, icon: Icon(Icons.add),),
        ],),

        body: PlaceList(placeList: [],),
    );
  }
}