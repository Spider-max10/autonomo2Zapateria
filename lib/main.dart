import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/shoes_screen.dart';
import 'screens/marcas_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/register': (context) => RegisterScreen(onAddUser: (User ) {  },),
        '/login': (context) => LoginScreen(),
        '/settings': (context) => SettingsScreen(),
        '/shoes': (context) => ShoesScreen(),
        // '/users': (context) => UsersScreen(),
        '/marcas': (context) => MarcasScreen(),


      },
    );
  }
}
