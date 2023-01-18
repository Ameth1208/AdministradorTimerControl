import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/ui/pages/selector_devices.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const SelectorDevices(),
    );
  }
}
