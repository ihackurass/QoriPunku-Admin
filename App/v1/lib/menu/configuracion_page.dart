import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ConfiguracionPage extends StatefulWidget {
  @override
  _ConfiguracionPageState createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  final _passwordController = TextEditingController();
  final _numeroController = TextEditingController();
  final String apiUrl = "https://${ApiConfig.baseUrl}/CA/update_config.php";  // Reemplaza con tu URL

  Future<void> actualizarPassword() async {
    final password = _passwordController.text;
    if (RegExp(r'^\d{5}$').hasMatch(password)) {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'password': password,
      });

      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('La contraseña debe ser de 5 dígitos.')),
      );
    }
  }

  Future<void> actualizarNumero() async {
    final numero = _numeroController.text;
    if (RegExp(r'^\d{9}$').hasMatch(numero)) {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'numero': numero,
      });

      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El número debe ser de 9 dígitos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Actualizar Contraseña',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.number,
              maxLength: 5,
              decoration: InputDecoration(
                hintText: 'Ingrese una nueva contraseña (5 dígitos)',
                counterText: '',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: actualizarPassword,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              child: Text('Actualizar Contraseña'),
            ),
            SizedBox(height: 20),
            Text(
              'Actualizar Número de Teléfono',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              maxLength: 9,
              decoration: InputDecoration(
                hintText: 'Ingrese un nuevo número (9 dígitos)',
                counterText: '',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: actualizarNumero,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              child: Text('Actualizar Número'),
            ),
          ],
        ),
      ),
    );
  }
}
