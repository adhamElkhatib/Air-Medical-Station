enum DoctorSpecialization {
  generalPractitioner,
  cardiologist,
  dermatologist,
  endocrinologist,
  gastroenterologist,
  neurologist,
  oncologist,
  orthopedic,
  pediatrician,
  psychiatrist,
  pulmonologist,
  rheumatologist,
  urologist,
  ophthalmologist,
  ENT,
}

extension DoctorSpecializationExtension on DoctorSpecialization {
  String get name {
    switch (this) {
      case DoctorSpecialization.generalPractitioner:
        return 'General Practitioner';
      case DoctorSpecialization.cardiologist:
        return 'Cardiologist';
      case DoctorSpecialization.dermatologist:
        return 'Dermatologist';
      case DoctorSpecialization.endocrinologist:
        return 'Endocrinologist';
      case DoctorSpecialization.gastroenterologist:
        return 'Gastroenterologist';
      case DoctorSpecialization.neurologist:
        return 'Neurologist';
      case DoctorSpecialization.oncologist:
        return 'Oncologist';
      case DoctorSpecialization.orthopedic:
        return 'Orthopedic';
      case DoctorSpecialization.pediatrician:
        return 'Pediatrician';
      case DoctorSpecialization.psychiatrist:
        return 'Psychiatrist';
      case DoctorSpecialization.pulmonologist:
        return 'Pulmonologist';
      case DoctorSpecialization.rheumatologist:
        return 'Rheumatologist';
      case DoctorSpecialization.urologist:
        return 'Urologist';
      case DoctorSpecialization.ophthalmologist:
        return 'Ophthalmologist';
      case DoctorSpecialization.ENT:
        return 'Ear, Nose, and Throat (ENT)';
    }
  }
}
