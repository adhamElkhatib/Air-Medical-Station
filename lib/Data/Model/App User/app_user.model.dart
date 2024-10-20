import 'dart:convert';

import '../Shared/gender.enum.dart';
import '../Shared/specialization.enum.dart';

class AppUser {
  String id;
  String email;
  String name;
  Gender gender;
  String? imageUrl;
  DoctorSpecialization doctorSpecialization;

  // String dateOfBirth;
  // String phoneNumber;
  // List<String>? classesIds;
  // List<String>? subjectsIds;

  //
  //
  AppUser({
    required this.id,
    required this.email,
    required this.name,
    this.imageUrl,
    required this.gender,
    required this.doctorSpecialization,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullName': name,
      'imageUrl': imageUrl,
      "gender": gender.index,
      "specialization": doctorSpecialization.index,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      email: map['email'],
      name: map['fullName'],
      imageUrl: map['imageUrl'],
      gender: Gender.values[map["gender"]],
      doctorSpecialization: DoctorSpecialization.values[map["specialization"]],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
