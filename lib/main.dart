import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:traveloca/model/place.dart';
import 'package:traveloca/screens/add_place.dart';
import 'package:traveloca/screens/places.dart';

final colorScheme = ColorScheme.fromSeed( 
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 4, 148, 173),
  background: Color.fromARGB(255, 119, 112, 129),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  
  runApp(
      
      const ProviderScope(
        child:  MyApp(
        
        ),
      ),
  );
}

class MyApp extends StatelessWidget {
  
  
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: theme,
      home: FlacesScreen(),
    );
  }
}