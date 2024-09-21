class Blood {
  final String name;
  final String phone;
  final String bloodGroup;

  Blood({required this.name, required this.phone, required this.bloodGroup});

  factory Blood.fromJson(Map<String, dynamic> json) {
    return Blood(
      name: json['name'],
      phone: json['phone'],
      bloodGroup: json['blood'],
    );
  }
}
