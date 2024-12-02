import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home_screen.dart';
import 'package:flutterapp/screens/data_screen.dart';
import 'package:flutterapp/screens/contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class GlobalThemData {
  static ColorScheme themeData() {
    return const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 0, 70, 128),
        onPrimary: Color.fromARGB(255, 190, 214, 255),
        secondary: Color.fromARGB(255, 198, 65, 255),
        onSecondary: Color.fromARGB(255, 30, 0, 60),
        error: Colors.red,
        onError: Color.fromARGB(255, 255, 255, 255),
        surface: Color.fromARGB(255, 114, 206, 255),
        onSurface: Color.fromARGB(255, 255, 255, 255));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 0, 70, 128),
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 48,
            color: Color.fromARGB(255, 142, 180, 247),
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: GlobalThemData.themeData(),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const DataScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: colorTheme.onPrimary,
          title: Text('Flutter App 2',
              style: TextStyle(color: colorTheme.primary)),
          centerTitle: true,
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorTheme.onPrimary,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() => currentIndex = i);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.house_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.house)),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_saver_off), label: 'Data'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_support_outlined),
              label: 'Contact',
              activeIcon: Icon(Icons.contact_support)),
        ],
      ),
    );
  }
}
