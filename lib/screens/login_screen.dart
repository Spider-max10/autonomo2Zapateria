import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Obtener la lista de usuarios
    List<User> users = UserService.getUsers();

    // Verificar las credenciales
    User? user;
    try {
      user = users.firstWhere(
        (user) => user.correo == email && user.password == password,
      );
    } catch (e) {
      user = null;
    }

    if (user != null) {
      // Credenciales correctas
      Navigator.pushNamed(context, '/shoes');
    } else {
      // Credenciales incorrectas, mostrar mensaje de error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('Correo electrónico o contraseña incorrectos'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Registrarse'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Configuracion'),
            ),
            SizedBox(height: 60.0),
            Text(
              'Usuarios disponibles por defecto(puede registrar nuevos usuarios):',
              style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 147, 217, 90)),
            ),
            Text(
              'alice@example.com, 12345',
              style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 255, 122, 122)),
            ),
            SizedBox(height: 10.0),
                        Text(
              'bob@example.com, 54321',
              style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 255, 122, 122)),
            ),
          ],
        ),
      ),
    );
  }
}
