//t2 Core Packages Imports
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../Data/Model/Notes/notes.dart';
import '../../../../Data/Model/Patient/patient.dart';
import '../../../../Data/Model/Shared/consult.enum.dart';
import '../../../../Data/Model/Shared/gender.enum.dart';
import '../../../../Data/Repositories/note.repo.dart';
import '../../../../Data/Repositories/patient.repo.dart';
import '../../../../core/Services/Auth/AuthService.dart';
import '../../../../core/Services/Firebase Storage/firebase_storage.service.dart';
import '../../../../core/Services/Firebase Storage/src/models/storage_file.model.dart';
import '../../../../core/Services/Id Generating/id_generating.service.dart';
import '../../../../core/utils/SnackBar/snackbar.helper.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/upload_file.widget.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class SharedMedicalRecordsScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  final FormController formController;
  final TabController tabController;
  final Gender? selectedGender;
  final Consult? selectedConsult;
  final XFile? profileImage;

  //!SECTION
  //
  const SharedMedicalRecordsScreen({
    super.key,
    required this.formController,
    required this.tabController,
    required this.selectedGender,
    required this.selectedConsult,
    required this.profileImage,
  });

  @override
  State<SharedMedicalRecordsScreen> createState() =>
      _SharedMedicalRecordsScreenState();
}

class _SharedMedicalRecordsScreenState
    extends State<SharedMedicalRecordsScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  List<File> uploadedFiles = [];
  List<String> fileNames = [];
  List<int> fileSizes = [];
  final sharedMedicalRecordsKey = GlobalKey<FormState>();

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
  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        uploadedFiles.addAll(
          result.files.map((file) {
            String path = file.path!;
            File fileObj = File(path);

            // Add file details to the lists
            fileNames.add(file.name);
            fileSizes.add(file.size);

            return fileObj;
          }).toList(),
        );
      });

      // Print file details
      for (int i = 0; i < uploadedFiles.length; i++) {
        print("File Name: ${fileNames[i]}, Size: ${fileSizes[i]} bytes");
      }
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
      body: Form(
        key: sharedMedicalRecordsKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upload Files",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  uploadedFiles.isNotEmpty
                      ? TextButton(
                          onPressed: () {
                            pickFiles();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.upload,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              Text("Upload another file",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface))
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              uploadedFiles.isEmpty
                  ? GestureDetector(
                      onTap: () async {
                        pickFiles();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 40),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.upload,
                              size: 28,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Upload file',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(uploadedFiles.length, (index) {
                        return UploadFileWidget(
                          file: uploadedFiles[index],
                          fileName: fileNames[index],
                          fileSize: fileSizes[index],
                        );
                      }),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: "Save",
            onPressed: () async {
              if (!sharedMedicalRecordsKey.currentState!.validate()) return;
              String noteId = IdGeneratingService.generate();
              await NoteRepo().createSingle(
                  Note(
                      id: noteId,
                      date: DateFormat('EEEE, dd MMM yyyy')
                          .format(DateTime.now()),
                      note: widget.formController
                          .controller("notes")
                          .text
                          .trim()),
                  itemId: noteId);
              String patientId = IdGeneratingService.generate();
              Patient newPatient = Patient(
                id: patientId,
                name: widget.formController.controller("name").text.trim(),
                gender: widget.selectedGender!,
                dateOfBirth:
                    widget.formController.controller("dateOfBirth").text,
                email: widget.formController.controller("email").text.trim(),
                phoneNumber:
                    widget.formController.controller("phoneNumber").text.trim(),
                height:
                    int.parse(widget.formController.controller("height").text),
                weight:
                    int.parse(widget.formController.controller("weight").text),
                hospitalName: widget.formController
                    .controller("hospitalName")
                    .text
                    .trim(),
                currentDiagnosis:
                    widget.formController.controller("currentDiagnosis").text,
                currentMedication:
                    widget.formController.controller("currentMedication").text,
                notesIds: [noteId],
                supervisingDoctorId: AuthService().getCurrentUserId(),
              );
              if (widget.profileImage != null) {
                try {
                  final imageData = await widget.profileImage!.readAsBytes();
                  final storageFile = StorageFile(
                    data: imageData,
                    fileName: patientId,
                    fileExtension: "jpeg",
                  );

                  final image = await FirebaseStorageService.uploadSingle(
                    "/patients images",
                    storageFile,
                  );

                  for (int i = 0; i < uploadedFiles.length; i++) {
                    await FirebaseStorageService.uploadSingle(
                      '/patients documents/$patientId',
                      StorageFile(
                        data: await uploadedFiles[i].readAsBytes(),
                        fileName: fileNames[i],
                        fileExtension: 'jpeg',
                      ),
                    )?.then((_) async {
                      await SnackbarHelper.showTemplated(context,
                          title:
                              "A file has been uploaded out of ${uploadedFiles.length} files");
                    });
                  }
                  newPatient.imageUrl = await image?.ref.getDownloadURL();
                } catch (e) {
                  // Handle error if needed
                  print("Failed to upload profile image: $e");
                }
              }
              await PatientRepo().createSingle(newPatient, itemId: patientId);
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
    //!SECTION
    super.dispose();
  }
}
