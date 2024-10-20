//t2 Core Packages Imports
import 'package:air_medical_station/Data/Repositories/user.repo.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Model/Patient/patient.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class ViewHealthSummaryScreen extends StatelessWidget {
  //SECTION - Widget Arguments
  final Patient patient;

  //!SECTION
  //
  const ViewHealthSummaryScreen({
    super.key,
    required this.patient,
  });

  //SECTION - Stateless functions
  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
        body: FutureBuilder(
      future: AppUserRepo().readSingle(patient.supervisingDoctorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Text(
                  "Supervising Doctor:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                //
                Text(snapshot.data!.name,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 16,
                ),
                //
                Text(
                  "Current Diagnosis:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(patient.currentDiagnosis ?? "Not yet diagnosed",
                    style: Theme.of(context).textTheme.bodyMedium),
                //
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Current Medication:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                //
                Text(
                    patient.currentMedication ??
                        "Didn't receive medication yet",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 16,
                ),
                //
                Text(
                  "Notes:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                    (patient.notesIds == null || patient.notesIds!.isEmpty)
                        ? "No notes yet"
                        : "",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));

    //!SECTION
  }
}
