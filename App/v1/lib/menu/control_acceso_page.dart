import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

class ControlAccesoPage extends StatefulWidget {
  @override
  _ControlAccesoPageState createState() => _ControlAccesoPageState();
}

class _ControlAccesoPageState extends State<ControlAccesoPage> {
  List<String> _imagenes = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    final response = await http.get(Uri.parse("https://${ApiConfig.baseUrl}/CA/list_images.php"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        setState(() {
          _imagenes = List<String>.from(data['images']);
        });
      }
    }
  }

  Future<void> _eliminarImagen(String imageUrl) async {
    final response = await http.post(
      Uri.parse("https://${ApiConfig.baseUrl}/CA/delete_image.php"),
      body: {'image': imageUrl},
    );

    final responseData = json.decode(response.body);

    if (responseData['status'] == 'success') {
      setState(() {
        _imagenes.remove(imageUrl);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Imagen eliminada con éxito.")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error al eliminar la imagen.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de Acceso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _imagenes.isEmpty
            ? Center(
          child: Text(
            "No hay imágenes disponibles",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: _imagenes.length,
          itemBuilder: (context, index) {
            final imageUrl = _imagenes[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () => _eliminarImagen(imageUrl),
                        icon: Icon(Icons.delete, color: Colors.white),
                        label: Text("Eliminar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
