//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';

import '../../../../Data/Model/Shared/consult.enum.dart';
import '../../../../core/widgets/drop_down_menu.dart';
import '../../../../core/widgets/primary_button.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class ScheduleConsultScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  final FormController formController;
  final TabController tabController;
  final Function(Consult) fun;

  //!SECTION
  //
  const ScheduleConsultScreen({
    super.key,
    required this.formController,
    required this.tabController,
    required this.fun,
  });

  @override
  State<ScheduleConsultScreen> createState() => _ScheduleConsultScreenState();
}

class _ScheduleConsultScreenState extends State<ScheduleConsultScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  Consult? selectedConsult;
  final scheduleConsultKey = GlobalKey<FormState>();

  //t2 --Controllers
  //
  //t2 --State
  // final formKey = GlobalKey<FormState>();

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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        widget.formController.controller("date").text =
            "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}";
      });
    }
  }

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
          key: scheduleConsultKey,
          child: Column(
            children: [
              TextFormField(
                controller: widget.formController.controller("date"),
                decoration: const InputDecoration(
                  hintText: "mm/dd/yyyy",
                  label: Text("Date"),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Date cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              DropDownMenu(
                validator: (value) {
                  if (value == null || selectedConsult == null) {
                    return 'Select the next consult type';
                  }
                  return null;
                },
                labelText: "Consult",
                hintText: "Select consult type",
                value: selectedConsult,
                items: List.generate(Consult.values.length, (index) {
                  Consult consult = Consult.values[index];
                  return DropdownMenuItem<Consult>(
                    value: consult,
                    child: Text(consult.name),
                  );
                }),
                onChanged: (Consult? newValue) {
                  setState(() {
                    widget.fun(newValue!);
                    selectedConsult = newValue;
                  });
                },
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
              if (scheduleConsultKey.currentState!.validate()) {
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
