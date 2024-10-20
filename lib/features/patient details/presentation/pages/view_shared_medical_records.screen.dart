//t2 Core Packages Imports
import 'package:flutter/material.dart';

import '../../../../Data/Model/Patient/patient.dart';
import '../../../../core/Services/Firebase Storage/firebase_storage.service.dart';
import '../widgets/file_container.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class ViewSharedMedicalRecordsScreen extends StatelessWidget {
  // SECTION - Widget Arguments
  final Patient patient;

  //!SECTION
  //
  const ViewSharedMedicalRecordsScreen({super.key, required this.patient});

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
      body: FutureBuilder(
        future: FirebaseStorageService.downloadImagesInDirectory(
            "/patients documents/${patient.id}"),
        builder: (context, filesSnapshot) {
          if (filesSnapshot.connectionState == ConnectionState.done &&
              filesSnapshot.hasData &&
              filesSnapshot.data != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(filesSnapshot.data!.length,
                    (index) => FileContainer(file: filesSnapshot.data![index])),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );

    //!SECTION
  }
}
