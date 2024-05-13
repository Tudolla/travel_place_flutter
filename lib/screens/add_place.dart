import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traveloca/provider/user_place_provider.dart';
import 'package:traveloca/widgets/image_input.dart';

class AddPlace extends ConsumerStatefulWidget {

  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();

  void savePlace(){
    final enterTitle = _titleController.text;
    if(enterTitle.isEmpty){
      return;
    }
    ref.read(userPlaceProvider.notifier).addPlace(enterTitle);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),

            ),
            const SizedBox(height: 20,),
            ImageInput(),
            const SizedBox(height: 20,),



            ElevatedButton.icon(
             onPressed: savePlace,
             icon:  const Icon(Icons.add),

             label: const Text("Add", style: TextStyle(fontSize: 20,),),),
             
          ],
        ),
      ),
    );
  }
}