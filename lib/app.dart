import 'package:flutter/material.dart';
import 'package:learn_flutter/timer/view/timer_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pulse Timer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black, // Set the global cursor color to black
            selectionColor:
                Colors.blue[200], // Optional: text selection background color
            selectionHandleColor:
                Colors.blue, // Optional: selection handle color
          ),
          colorScheme: ColorScheme.light(
            brightness: Brightness.light,
            primary: Colors.white,
            // bg
            onPrimary: Colors.grey[800]!,
            // text
            secondary: Colors.grey[300]!,
            // bg 2
            onSecondary: Colors.redAccent,
            // text 2
            tertiary: Colors.grey[500]!,
            // bg 3
            onTertiary: Colors.grey[400]!,
            // text 3
            surface: Colors.grey[200]!,
            // Light grey for cards/surfaces
            onSurface: Colors.black,
            // Text/icons on surface
            inversePrimary: Colors.redAccent,
            // Highlights
            error: Colors.redAccent,
            // Standard error color
            onError: Colors.white, // Text/icons on error
          ),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
