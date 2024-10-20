//t2 Core Packages Imports
import 'dart:io';

import 'package:air_medical_station/features/add%20patient/presentation/pages/basic_info.screen.dart';
import 'package:air_medical_station/features/add%20patient/presentation/pages/health_summary.screen.dart';
import 'package:air_medical_station/features/add%20patient/presentation/pages/shared_medical_records.screen.dart';
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Data/Model/Shared/consult.enum.dart';
import '../../../../Data/Model/Shared/gender.enum.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class AddNewPatient extends StatefulWidget {
  // SECTION - Widget Arguments
  //!SECTION
  //
  const AddNewPatient({super.key});

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient>
    with SingleTickerProviderStateMixin {
  //
  //SECTION - State Variables
  //t2 --Controllers
  late FormController formController;
  XFile? profileImage;

  Gender? selectedGender;
  Consult? selectedConsult;
  List<File> uploadedFiles = [];
  late TabController tabController;

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
    formController = FormController();
    tabController = TabController(length: 3, vsync: this);
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
  // bool validateAllTabs() {
  //   return basicInfoKey.currentState!.validate() &&
  //       healthSummaryKey.currentState!.validate() &&
  //       scheduleConsultKey.currentState!.validate() &&
  //       sharedMedicalRecordsKey.currentState!.validate();
  // }

  //SECTION - Action Callbacks
  //!SECTION
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
        title: Text(
          "Add New Patient",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: TabBar(
              // enableFeedback: false,
              controller: tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: const [
                Tab(text: 'Basic info'),
                Tab(text: 'Health Summary'),
                // Tab(text: 'Schedule Consult'),
                Tab(text: 'Shared Medical Records'),
              ],
              onTap: (index) {
                // Do nothing on tap to disable tab switching
              },
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        // Disable swipe gestures
        children: [
          BasicInfoScreen(
            formController: formController,
            tabController: tabController,
            genderFun: (value) {
              setState(() {
                selectedGender = value;
              });
            },
            patientImageFun: (value) {
              setState(() {
                profileImage = value;
              });
            },
          ),
          HealthSummaryScreen(
            formController: formController,
            tabController: tabController,
          ),
          // ScheduleConsultScreen(
          //   formController: formController,
          //   tabController: tabController,
          //   fun: (value) {
          //     setState(() {
          //       selectedConsult = value;
          //     });
          //   },
          // ),
          SharedMedicalRecordsScreen(
            formController: formController,
            tabController: tabController,
            selectedGender: selectedGender,
            selectedConsult: selectedConsult,
            profileImage: profileImage,
          ),
        ],
      ),
    );
    //!SECTION
  }
}
