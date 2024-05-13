import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traveloca/model/place.dart';




class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier(): super(const[]);

  void addPlace(String title){
    final newPlace = Place(title: title);
    state = [newPlace, ...state];

  }

}

final userPlaceProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>((ref) => UserPlaceNotifier());