import 'package:air_medical_station/Data/Model/App%20User/app_user.model.dart';
import 'package:air_medical_station/Data/Repositories/user.repo.dart';
import 'package:air_medical_station/core/Services/Auth/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../Data/Model/Patient/patient.dart';
import '../../../../constants.dart';

// // Sample function to generate or retrieve token (replace with your own implementation)
// Future<String> generateToken(String channelName) async {
//   // Replace with your token generation logic
//   return 'your_generated_token_for_$channelName';
// }

class VideoCallScreen extends StatefulWidget {
  final Patient patient;

  const VideoCallScreen({
    super.key,
    required this.patient,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  // late AgoraClient client;

  @override
  void initState() {
    super.initState();
    intializeZegoCall();
  }

  Future<void> intializeZegoCall() async {
    try {
      if (ZegoUIKitPrebuiltCallInvitationService().isInit) {
        await ZegoUIKitPrebuiltCallInvitationService().uninit();
      }
      AppUser? appUser = await AppUserRepo().readSingle(AuthService().getCurrentUserId());
      if (appUser != null) {
        await ZegoUIKitPrebuiltCallInvitationService().init(
          appID: Constants.appID,
          appSign: Constants.appSign,
          userID: appUser.id,
          userName: appUser.name,
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
        print(
            "Initialization successful for user with ID: ${appUser.id} ${ZegoUIKitPrebuiltCallInvitationService().isInit}");
      } else {
        print("selectedPatient is null, cannot initialize Zego call service.");
      }
    } catch (e) {
      print("Error initializing Zego call service: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Video Call Appointment"),
      ),
      body: ZegoSendCallInvitationButton(
        isVideoCall: true,
        //You need to use the resourceID that you created in the subsequent steps.
        //Please continue reading this document.
        resourceID: "zegouikit_call",
        invitees: [
          ZegoUIKitUser(
            id: widget.patient.id,
            name: widget.patient.name,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of other resources if needed
    super.dispose();
  }
}
