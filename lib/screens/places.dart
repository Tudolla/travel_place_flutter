import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traveloca/provider/user_place_provider.dart';
import 'package:traveloca/screens/add_place.dart';
import 'package:traveloca/widgets/place_list.dart';

class FlacesScreen extends ConsumerWidget {
  const FlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddPlace()));
          }, icon: Icon(Icons.add),),
        ],),

        body: PlaceList(placeList: places,),
    );
  }
}