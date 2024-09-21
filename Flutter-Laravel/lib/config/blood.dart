class Blood {
  final String name;
  final String phone;
  final String blood;

  Blood({required this.name, required this.phone, required this.blood});

  factory Blood.fromJson(Map<String, dynamic> json) {
    return Blood(
      name: json['name'],
      phone: json['phone'],
      blood: json['blood'],
    );
  }
}
