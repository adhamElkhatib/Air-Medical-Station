import 'dart:convert';

import 'package:air_medical_station/Data/Model/Shared/gender.enum.dart';

class Patient {
  String id;
  String name;
  String dateOfBirth;
  int height;
  int weight;
  String? imageUrl;
  Gender gender;
  String email;
  String phoneNumber;
  String hospitalName;
  String supervisingDoctorId;
  String? currentMedication;
  String? currentDiagnosis;
  List<String?>? notesIds;

  //
  //
  Patient({
    required this.id,
    required this.name,
    required this.gender,
    this.imageUrl,
    required this.supervisingDoctorId,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.height,
    required this.hospitalName,
    required this.weight,
    required this.currentDiagnosis,
    required this.currentMedication,
    required this.notesIds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender.index,
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "email": email,
      "dateOfBirth": dateOfBirth,
      "height": height,
      "weight": weight,
      "hospitalName": hospitalName,
      "supervisingDoctorId": supervisingDoctorId,
      "currentDiagnosis": currentDiagnosis,
      "currentMedication": currentMedication,
      "notesIds": notesIds,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'] as String,
      name: map['name'] as String,
      gender: Gender.values[map["gender"]],
      imageUrl: map['imageUrl'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      height: map['height'] as int,
      weight: map['weight'] as int,
      hospitalName: map['hospitalName'] as String,
      supervisingDoctorId: map['supervisingDoctorId'] as String,
      currentDiagnosis: map['currentDiagnosis'] != null
          ? map['currentDiagnosis'] as String
          : null,
      currentMedication: map['currentMedication'] != null
          ? map['currentMedication'] as String
          : null,
      notesIds: map['notesIds'] != null
          ? List<String?>.from(map['notesIds'] as List<dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
