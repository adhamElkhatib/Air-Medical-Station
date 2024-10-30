import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../Data/Model/Patient/patient.dart';

class CallInvitationWidget extends StatelessWidget {
  final Patient patient;

  const CallInvitationWidget({
    super.key, required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return ZegoSendCallInvitationButton(
      isVideoCall: true,
      resourceID: 'zegouikit_call',
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      iconSize: const Size(40, 40),
      buttonSize: const Size(50, 50),
      invitees: [
        ZegoUIKitUser(
          id: patient.id,
          name: patient.name,
        ),
      ],
    );
  }
}