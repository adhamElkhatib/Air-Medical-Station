//t2 Core Packages Imports
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Data/Model/Shared/gender.enum.dart';
import '../../../../core/Services/Imaging/imaging.service.dart';
import '../../../../core/widgets/drop_down_menu.dart';
import '../../../../core/widgets/primary_button.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class BasicInfoScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  final FormController formController;
  final TabController tabController;
  final Function(Gender) genderFun;
  final Function(XFile) patientImageFun;

  //!SECTION
  //
  const BasicInfoScreen({
    super.key,
    required this.formController,
    required this.tabController,
    required this.genderFun,
    required this.patientImageFun,
  });

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  //t2 --Controllers
  //
  //t2 --State
  final basicInfoKey = GlobalKey<FormState>();
  XFile? profileImage;
  Gender? selectedGender;

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
        widget.formController.controller("dateOfBirth").text =
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
            key: basicInfoKey,
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      profileImage = await ImagingService.captureSingleImages();
                      if (profileImage != null) {
                        widget.patientImageFun(profileImage!);
                      }
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFFF1EAFE),
                      radius: 36,
                      child: profileImage == null
                          ? const Icon(
                              Icons.person_outlined,
                              size: 48,
                              // color: Color(0xff824AFD),
                            )
                          : ClipOval(
                              child: Image.file(
                                File(profileImage!.path),
                                fit: BoxFit.cover,
                                width: 72,
                                height: 72,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.formController.controller("name"),
                  decoration: const InputDecoration(
                    hintText: "Enter patient's name",
                    label: Text("Full name"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full name cannot be empty';
                    } else if (value.length < 3) {
                      return 'Full name must be at least 3 characters long';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Gender
                DropDownMenu(
                  labelText: "Gender",
                  hintText: "Select patient's gender",
                  value: selectedGender,
                  items: List.generate(Gender.values.length, (index) {
                    Gender gender = Gender.values[index];
                    return DropdownMenuItem<Gender>(
                      value: gender,
                      child: Text(gender.name),
                    );
                  }),
                  validator: (value) {
                    if (value == null || selectedGender == null) {
                      return 'Please select patient\'s gender';
                    }
                    return null;
                  },
                  onChanged: (Gender? newValue) {
                    setState(() {
                      widget.genderFun(newValue!);
                      selectedGender = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.formController.controller("dateOfBirth"),
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
                TextFormField(
                  controller: widget.formController.controller("height"),
                  decoration: const InputDecoration(
                    hintText: "Enter patient's height in meters",
                    label: Text("Height"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient\'s height';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.formController.controller("weight"),
                  decoration: const InputDecoration(
                    hintText: "Enter patient's weight in Kgs",
                    label: Text("Weight"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient\'s weight';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.formController.controller("email"),
                  decoration: const InputDecoration(
                    hintText: "Enter patient's email",
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient\'s email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.formController.controller("phoneNumber"),
                  decoration: const InputDecoration(
                    hintText: "Enter patient's phone number",
                    label: Text("Phone Number"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient\'s phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.formController.controller("hospitalName"),
                  decoration: const InputDecoration(
                    hintText: "Enter hospital name",
                    label: Text("Hospital Name"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient\'s hospital location';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: "Next",
            onPressed: () {
              if (basicInfoKey.currentState!.validate()) {
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
