import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {

  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();

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
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),

            ),
            const SizedBox(height: 20,),

            ElevatedButton.icon(
             onPressed: (){},
             icon:  const Icon(Icons.add),
             label: const Text("Add", style: TextStyle(fontSize: 20,),),),
             
          ],
        ),
      ),
    );
  }
}