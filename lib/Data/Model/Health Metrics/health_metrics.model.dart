import 'dart:convert';

class HealthMetrics {
  String patientId;
  int bloodOxygenLevel;
  int heartRate;
  String bloodPressure;

  //
  HealthMetrics(
      {required this.patientId,
        required this.bloodOxygenLevel,
        required this.heartRate,
        required this.bloodPressure});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patientId': patientId,
      'bloodOxygenLevel': bloodOxygenLevel,
      "heartRate": heartRate,
      "bloodPressure": bloodPressure,
    };
  }

  factory HealthMetrics.fromMap(Map<String, dynamic> map) {
    return HealthMetrics(
      patientId: map['patientId'] as String,
      bloodPressure: map['bloodPressure'] as String,
      bloodOxygenLevel: map['bloodOxygenLevel'] as int,
      heartRate: map['heartRate'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthMetrics.fromJson(String source) =>
      HealthMetrics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant HealthMetrics other) {
    if (identical(this, other)) return true;

    return other.patientId == patientId;
  }

  @override
  int get hashCode => patientId.hashCode;
}
