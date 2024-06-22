import 'package:flutter/material.dart';
import '../models/user_model.dart'; 
import '../services/user_service.dart'; 

class RegisterScreen extends StatefulWidget {
  final Function(User) onAddUser;

  RegisterScreen({required this.onAddUser});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitData(BuildContext context) {
    final name = _nameController.text;
    final correo = _correoController.text;
    final password = _passwordController.text;

    if (name.isEmpty || correo.isEmpty || password.isEmpty) {
      return;
    }

    // widget.onAddUser(User(name: name, correo: correo, password: password));
    UserService.addUser(User(name: name, correo: correo, password: password));

    

    _nameController.clear();
    _correoController.clear();
    _passwordController.clear();

    // Navegar a la pantalla de lista de usuarios
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _correoController,
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
                _submitData(context);
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
