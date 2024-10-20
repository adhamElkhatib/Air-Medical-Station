import 'package:air_medical_station/Data/Model/Patient/patient.dart';

import '../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class PatientRepo extends FirestoreRepo<Patient> {
  PatientRepo()
      : super(
          'Patients',
        );

  @override
  Patient? toModel(Map<String, dynamic>? item) => Patient.fromMap(item ?? {});

  @override
  Map<String, dynamic>? fromModel(Patient? item) => item?.toMap() ?? {};
}
