//t2 Core Packages Imports
import 'package:air_medical_station/Data/Repositories/user.repo.dart';
import 'package:air_medical_station/core/widgets/primary_button.dart';
import 'package:air_medical_station/core/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../Data/Model/Shared/gender.enum.dart';
import '../../../../Data/Model/Shared/specialization.enum.dart';
import '../../../../core/widgets/drop_down_menu.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class EditProfileScreen extends StatefulWidget {
  // SECTION - Widget Arguments
  final AppUser appUser;

  //!SECTION
  //
  const EditProfileScreen({super.key, required this.appUser});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  late FormController _formController;
  late Gender selectedGender;
  late DoctorSpecialization selectedDoctorSpecialization;
  final _formKey = GlobalKey<FormState>();

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
    _formController = FormController();
    _formController.controller("name").text = widget.appUser.name;
    _formController.controller("email").text = widget.appUser.email;
    selectedGender = widget.appUser.gender;
    selectedDoctorSpecialization = widget.appUser.doctorSpecialization;
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
    // SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Your Profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFF1EAFE),
                  radius: 24,
                  child: (widget.appUser.imageUrl == null)
                      ? Icon(
                          Icons.person_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        )
                      : ClipOval(
                          child: Image.network(
                            widget.appUser.imageUrl!,
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _formController.controller("name"),
                  decoration: const InputDecoration(
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
                TextFormField(
                  controller: _formController.controller("email"),
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Gender
                DropDownMenu(
                  labelText: "Gender",
                  hintText: "Select your Gender",
                  value: selectedGender,
                  items: List.generate(Gender.values.length, (index) {
                    Gender gender = Gender.values[index];
                    return DropdownMenuItem<Gender>(
                      value: gender,
                      child: Text(gender.name),
                    );
                  }),
                  onChanged: (Gender? newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                ),
                // specialization
                const SizedBox(
                  height: 16,
                ),
                DropDownMenu(
                  labelText: "Specialization",
                  hintText: "Select your specialization",
                  value: selectedDoctorSpecialization,
                  items: List.generate(DoctorSpecialization.values.length,
                      (index) {
                    final specialization = DoctorSpecialization.values[index];
                    return DropdownMenuItem<DoctorSpecialization>(
                      value: specialization,
                      child: Text(specialization.name),
                    );
                  }),
                  onChanged: (DoctorSpecialization? newValue) {
                    setState(() {
                      selectedDoctorSpecialization = newValue!;
                    });
                  },
                ),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                  title: "Discard",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: PrimaryButton(
                    title: "Save Changes",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        widget.appUser.email =
                            _formController.controller("email").text.trim();
                        widget.appUser.name =
                            _formController.controller("name").text.trim();
                        widget.appUser.gender = selectedGender;
                        widget.appUser.doctorSpecialization =
                            selectedDoctorSpecialization;
                        await AppUserRepo()
                            .updateSingle(widget.appUser.id, widget.appUser);
                        Navigator.pop(context);
                      }
                    })),
          ],
        ),
      ),
    );

    //!SECTION
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }
}
