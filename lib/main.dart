import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home_page.dart';
import 'package:learn_flutter/pages/login_page.dart';
import 'package:learn_flutter/providers/pulse_timer.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/report_page.dart';
import 'pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => PulseTimer(),
      child: MyApp(),
    ),
  );
}

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
          selectionHandleColor: Colors.blue, // Optional: selection handle color
        ),
        colorScheme: ColorScheme(
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
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ReportPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            'Pulse Timer',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index; // Update the selected tab
            });
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          destinations: <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart),
              label: 'Reports',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
