import 'package:flutter/material.dart';
import 'service/uuid_service.dart';
import 'model/uuid_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ConcederUUIDPage extends StatefulWidget {
  @override
  _ConcederUUIDPageState createState() => _ConcederUUIDPageState();
}

class _ConcederUUIDPageState extends State<ConcederUUIDPage> {
  late Future<List<UUID>> futureUUIDs;

  @override
  void initState() {
    super.initState();
    futureUUIDs = UUIDService().fetchUUIDs();
  }

  // Function to toggle the UUID status on the server and update the UI
  Future<void> toggleUUIDStatus(UUID uuid, List<UUID> uuidList) async {
    final response = await http.post(
      Uri.parse('https://${ApiConfig.baseUrl}/CA/toggle_uuid_status.php'), // Update with your URL
      body: {'uuid': uuid.uuid},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'success') {
        setState(() {
          // Update the status of the UUID in the list with copyWith
          final newStatus = data['new_status'];
          final index = uuidList.indexWhere((u) => u.uuid == uuid.uuid);

          if (index != -1) {
            uuidList[index] = uuid.copyWith(status: newStatus);
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${data["message"]}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to the server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conceder UUID'),
      ),
      body: FutureBuilder<List<UUID>>(
        future: futureUUIDs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No UUIDs found.'));
          } else {
            final uuidList = snapshot.data!;
            return ListView.builder(
              itemCount: uuidList.length,
              itemBuilder: (context, index) {
                final uuid = uuidList[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('UUID: ${uuid.uuid}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ${uuid.status}'),
                        Text('Fecha: ${uuid.createdAt}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        uuid.status == 'denied' ? Icons.lock_outline : Icons.check,
                        color: uuid.status == 'denied' ? Colors.red : Colors.green,
                      ),
                      onPressed: () => toggleUUIDStatus(uuid, uuidList),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
