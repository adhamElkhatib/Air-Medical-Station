//t2 Core Packages Imports
import 'package:flutter/material.dart';

import '../widgets/UpcomingAppointmentWidget.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class ViewAllAppointments extends StatelessWidget {
  // SECTION - Widget Arguments
  //!SECTION
  //
  const ViewAllAppointments({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return const UpcomingAppointmentWidget();
            }),
      ),
    );

    //!SECTION
  }
}
