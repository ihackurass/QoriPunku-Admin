class UUID {
  final String uuid;
  final String status;
  final String createdAt;

  UUID({
    required this.uuid,
    required this.status,
    required this.createdAt,
  });

  // Método para crear una copia del UUID con propiedades modificadas
  UUID copyWith({
    String? uuid,
    String? status,
    String? createdAt,
  }) {
    return UUID(
      uuid: uuid ?? this.uuid,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // Método para crear un UUID desde JSON
  factory UUID.fromJson(Map<String, dynamic> json) {
    return UUID(
      uuid: json['uuid'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
    );
  }

  // Método para convertir un UUID a JSON
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'status': status,
      'created_at': createdAt,
    };
  }
}
