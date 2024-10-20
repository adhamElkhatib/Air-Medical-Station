//t2 Core Packages Imports
import 'package:air_medical_station/features/add%20patient/presentation/pages/add_new_patient.screen.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Model/Patient/patient.dart';
import '../widgets/patient_card.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class ViewAllPatients extends StatelessWidget {
  // SECTION - Widget Arguments
  final List<Patient?>? patients;

  //!SECTION
  //
  const ViewAllPatients({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    // SECTION - Build Setup
    // Values
    // double w = MediaQuery.of(context).size.width;",
    // double h = MediaQuery.of(context).size.height;",
    // Widgets
    //
    // Widgets
    //!SECTION

    // SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Patients"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AddNewPatient(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SearchBar(
            //   elevation: WidgetStateProperty.all(0),
            //   hintText: "patient name",
            //   backgroundColor: WidgetStateProperty.all(
            //       Theme.of(context).colorScheme.tertiaryContainer),
            //   trailing: const [Icon(Icons.search)],
            // ),
            // const SizedBox(
            //   height: 32,
            // ),
            Column(
              children: List.generate(patients?.length ?? 0, (index) {
                return PatientCard(
                  patient: patients![index]!,
                );
              }),
            )
          ],
        ),
      ),
    );

    //!SECTION
  }
}
