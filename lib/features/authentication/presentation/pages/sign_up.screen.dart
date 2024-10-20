//t2 Core Packages Imports
import 'package:air_medical_station/Data/Model/Shared/specialization.enum.dart';
import 'package:air_medical_station/core/utils/SnackBar/snackbar.helper.dart';
import 'package:air_medical_station/features/authentication/presentation/pages/sign_in.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snackbar_plus/flutter_snackbar_plus.dart';
import 'package:form_controller/form_controller.dart';

import '../../../../Data/Model/Shared/gender.enum.dart';
import '../../../../core/Services/Auth/AuthService.dart';
import '../../../../core/widgets/drop_down_menu.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../home/presentation/pages/home.screen.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class SignUpScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  late FormController _formController;

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
  final _formKey = GlobalKey<FormState>();
  Gender? selectedGender;
  DoctorSpecialization? selectedDoctorSpecialization;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    'Create Account',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onSurface),
                  ),
                  Text(
                    'Please note that patients are registered by their healthcare providers.',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Account info:',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _formController.controller("name"),
                    decoration: const InputDecoration(
                      hintText: "Full name",
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
                      hintText: "Email",
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
                    hintText: "Select your gender",
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
                        selectedGender = newValue;
                      });
                    },
                  ),
                  // specialization
                  const SizedBox(
                    height: 16,
                  ),
                  DropDownMenu(
                    labelText: "Specialization",
                    hintText: "Select your Specialization",
                    value: selectedDoctorSpecialization,
                    items: List.generate(DoctorSpecialization.values.length,
                            (index) {
                          final specialization = DoctorSpecialization
                              .values[index];
                          return DropdownMenuItem<DoctorSpecialization>(
                            value: specialization,
                            child: Text(specialization.name),
                          );
                        }),
                    onChanged: (DoctorSpecialization? newValue) {
                      setState(() {
                        selectedDoctorSpecialization = newValue;
                      });
                    },
                  ),
                  // password
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _formController.controller("password"),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Create account',
                onPressed: () async {
                  if (selectedDoctorSpecialization == null) {
                    SnackbarHelper.showTemplated(context,
                        title: "Please select your Specialization",
                        style: FlutterSnackBarStyle(
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .error,
                          titleStyle: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onError),
                        ));
                  }
                  if (_formKey.currentState!.validate()) {
                    bool success = await AuthService()
                        .signUpWithEmailAndPassword(
                        email:
                        _formController
                            .controller("email")
                            .text
                            .trim(),
                        password:
                        _formController
                            .controller("password")
                            .text,
                        fullName: _formController
                            .controller("name")
                            .text,
                        context: context,
                        doctorSpecialization: selectedDoctorSpecialization!,
                        gender: selectedGender!);
                    if (success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onSurface)),
                TextButton(
                  child: Text(
                    "Sign in",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignInScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    _formController.dispose();
    //!SECTION
    super.dispose();
  }
}
