class User {
  late int id;
  late String name;
  late String email;
  late int branchId;
  late int volunteerId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.branchId,
    required this.volunteerId,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    branchId = json['branch_id'];
    volunteerId = json['volunteer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['branch_id'] = branchId;
    data['volunteer_id'] = volunteerId;
    return data;
  }
}
