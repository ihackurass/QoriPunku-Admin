import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/uuid_model.dart';
import '../../config.dart';

class UUIDService {
  static const String baseUrl = 'https://${ApiConfig.baseUrl}/CA/get_uuids.php'; // Cambia a tu URL

  Future<List<UUID>> fetchUUIDs() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        List<dynamic> uuidList = data['uuids'];
        return uuidList.map((json) => UUID.fromJson(json)).toList();
      } else {
        throw Exception('Error al obtener los UUIDs');
      }
    } else {
      throw Exception('Error en la conexión al servidor');
    }
  }
}
