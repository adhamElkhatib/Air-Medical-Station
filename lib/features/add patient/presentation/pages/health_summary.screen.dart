//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';

import '../../../../core/widgets/primary_button.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class HealthSummaryScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  final FormController formController;
  final TabController tabController;

  //!SECTION
  //
  const HealthSummaryScreen({
    super.key,
    required this.formController,
    required this.tabController,
  });

  @override
  State<HealthSummaryScreen> createState() => _HealthSummaryScreenState();
}

class _HealthSummaryScreenState extends State<HealthSummaryScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  //t2 --Controllers
  //
  //t2 --State
  // final formKey = GlobalKey<FormState>();
  final healthSummaryKey = GlobalKey<FormState>();

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
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: healthSummaryKey,
          child: Column(
            children: [
              TextFormField(
                controller:
                    widget.formController.controller("currentDiagnosis"),
                decoration: const InputDecoration(
                  hintText: "Enter patient's current diagnosis",
                  label: Text("Current Diagnosis"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller:
                    widget.formController.controller("currentMedication"),
                decoration: const InputDecoration(
                  hintText: "Enter patient's current Medications",
                  label: Text("Current Medication"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: widget.formController.controller("notes"),
                decoration: const InputDecoration(
                  hintText: "Enter patient's weight in Kgs",
                  label: Text("Notes"),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: "Next",
            onPressed: () {
              if (healthSummaryKey.currentState!.validate()) {
                // navigate to the next tab
                if (widget.tabController.index <
                    widget.tabController.length - 1) {
                  widget.tabController
                      .animateTo(widget.tabController.index + 1);
                }
                // print(widget.formController.controller("date"));
              }
            },
          ),
        ),
      ),
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    // _formController.dispose();
    //!SECTION
    super.dispose();
  }
}
