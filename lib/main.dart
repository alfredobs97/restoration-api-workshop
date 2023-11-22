import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restoration_api_workshop/ui/app_router.dart';
import 'package:restoration_api_workshop/ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoration API workshop',
      restorationScopeId: 'root',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      home: const HomePage(),
    );
  }
}
