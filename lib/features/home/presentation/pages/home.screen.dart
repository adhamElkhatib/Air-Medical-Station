//t2 Core Packages Imports
import 'package:air_medical_station/Data/Repositories/patient.repo.dart';
import 'package:air_medical_station/core/Providers/src/condition_model.dart';
import 'package:air_medical_station/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../Data/Repositories/user.repo.dart';
import '../../../../core/Services/Auth/AuthService.dart';
import '../../../add patient/presentation/pages/add_new_patient.screen.dart';
import '../../../profile/presentation/pages/ProfileScreen.dart';
import '../widgets/patient_card.dart';
import 'ViewAllPatients.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class HomeScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers

  //t2 --Controllers
  //
  //t2 --State
  //t2 --State
  //
  //t2 --Constants

  //t2 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --Controllers & Listeners
    //t2 --Controllers & Listeners
    //
    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --State
    //t2 --State
    //!SECTION
  }

  //SECTION - Stateless functions
  //!SECTION
  //SECTION - Action Callbacks
  //!SECTION

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: FutureBuilder(
          future: AppUserRepo().readSingle(AuthService().getCurrentUserId()),
          builder: (BuildContext context, AsyncSnapshot<AppUser?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                            children: [
              Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ProfileScreen(
                              appUser: snapshot.data!,
                            ),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFF1EAFE),
                        radius: 16,
                        child: Icon(
                          Icons.person_outlined,
                          color: Color(0xff824AFD),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        Text(
                          'Dr, ${snapshot.data?.name}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  future: PatientRepo().readAllWhere([
                    QueryCondition.equals(
                        field: "supervisingDoctorId",
                        value: AuthService().getCurrentUserId())
                  ]),
                  builder: (context, patientsSnapshot) {
                    if (patientsSnapshot.connectionState ==
                            ConnectionState.done &&
                        patientsSnapshot.hasData &&
                        patientsSnapshot.data!.isNotEmpty) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Patients",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  ViewAllPatients(
                                                    patients: patientsSnapshot.data,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "See all",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    children: List.generate(
                                        patientsSnapshot.data!.length, (index) {
                                      return PatientCard(
                                        patient: patientsSnapshot.data![index]!,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 32),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: PrimaryButton(
                                    title: "Add New Patient",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) => const AddNewPatient(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } 
                    else if (patientsSnapshot.connectionState ==
                        ConnectionState.done &&
                        (!patientsSnapshot.hasData ||
                            patientsSnapshot.data == null ||
                            patientsSnapshot.data!.isEmpty)) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 80,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Get Started",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "It’s seems like you haven’t created any Patients yet.",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  title: "Add New Patient",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                        const AddNewPatient(),
                                      ),
                                    );
                                  },
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    }
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Upcoming Appointments",
              //       style: Theme.of(context)
              //           .textTheme
              //           .labelMedium
              //           ?.copyWith(
              //             color: Theme.of(context).colorScheme.onSurface,
              //           ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute<void>(
              //             builder: (BuildContext context) =>
              //                 const ViewAllAppointments(),
              //           ),
              //         );
              //       },
              //       child: Text(
              //         "See all",
              //         style: Theme.of(context)
              //             .textTheme
              //             .labelMedium
              //             ?.copyWith(
              //               color: Theme.of(context).colorScheme.primary,
              //             ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: UpcomingAppointmentWidget(),
              //     ),
              //     const SizedBox(
              //       width: 16,
              //     ),
              //     Expanded(
              //       child: UpcomingAppointmentWidget(),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: UpcomingAppointmentWidget(),
              //     ),
              //     const SizedBox(
              //       width: 16,
              //     ),
              //     Expanded(
              //       child: UpcomingAppointmentWidget(),
              //     ),
              //   ],
              // ),
                            ],
                          );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: PrimaryButton(
      //       title: "Add New Patient",
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute<void>(
      //             builder: (BuildContext context) => const AddNewPatient(),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    //!SECTION

    super.dispose();
  }
}
