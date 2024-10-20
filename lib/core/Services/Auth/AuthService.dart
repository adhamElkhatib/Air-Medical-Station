import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../Data/Model/App User/app_user.model.dart';
import '../../../Data/Model/Shared/gender.enum.dart';
import '../../../Data/Model/Shared/specialization.enum.dart';
import '../../../Data/Repositories/user.repo.dart';
import '../../../constants.dart';
import '../../../core/utils/SnackBar/snackbar.helper.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required DoctorSpecialization doctorSpecialization,
    required Gender gender,

    required BuildContext context,
  }) async {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      SnackbarHelper.showTemplated(context,
          content: const Text('Invalid email address'), title: 'Invalid email');
      return false;
    }

    if (password.length < 6) {
      SnackbarHelper.showTemplated(context,
          content: const Text('Password must be at least 6 characters long'),
          title: 'Invalid password');
      return false;
    }

    if (fullName.isEmpty) {
      SnackbarHelper.showTemplated(context,
          content: const Text('Full name cannot be empty'),
          title: 'Invalid name');
      return false;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await AppUserRepo().createSingle(
        AppUser(
          id: userCredential.user!.uid,
          email: email,
          name: fullName,
          gender:gender,
          doctorSpecialization: doctorSpecialization,

        ),
        itemId: userCredential.user!.uid,
      );
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: Constants.appID,
        appSign: Constants.appSign,
        userID: userCredential.user!.uid,
        userName: fullName,
        plugins: [ZegoUIKitSignalingPlugin()],
      );
      return true;
    } catch (e) {
      SnackbarHelper.showTemplated(context,
          content: Text('Error: ${e.toString()}'), title: 'Signup Error');
      return false;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser? user;
      if(userCredential.user != null){
         user =await AppUserRepo().readSingle(userCredential.user!.uid);
      }
      await ZegoUIKitPrebuiltCallInvitationService().init(
        appID: Constants.appID,
        appSign: Constants.appSign,
        userID: userCredential.user!.uid,
        userName: user!.name,
        plugins: [ZegoUIKitSignalingPlugin()],
        requireConfig: (ZegoCallInvitationData data) {
          final config = (data.invitees.length > 1)
              ? ZegoCallInvitationType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
              : ZegoCallInvitationType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

          /// custom avatar
          // config.avatarBuilder = customAvatarBuilder;

          /// support minimizing, show minimizing button
          config.topMenuBar.isVisible = true;
          config.topMenuBar.buttons
              .insert(0, ZegoCallMenuBarButtonName.minimizingButton);
          config.topMenuBar.buttons
              .insert(1, ZegoCallMenuBarButtonName.soundEffectButton);

          return config;
        },
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackbarHelper.showTemplated(context,
            content: const Text('No user found for that email.'),
            title: "Invalid User");
      } else if (e.code == 'wrong-password') {
        SnackbarHelper.showTemplated(context,
            title: 'Wrong password.',
            content: const Text("Wrong password provided for that user."));
      }
      return null;
    } catch (e) {
      print('Sign in failed: $e');
      return null;
    }
  }

  Stream<User?> isUserLoggedIn() {
    return _auth.authStateChanges();
  }

  String getCurrentUserId() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return '';
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      await ZegoUIKitPrebuiltCallInvitationService().uninit();
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}
