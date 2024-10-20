import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../Data/Model/Patient/patient.dart';

class CallInvitationPage extends StatefulWidget {
  const CallInvitationPage({
    super.key, required this.patient,
  });

  final Patient patient;

  @override
  State<CallInvitationPage> createState() => _CallInvitationPageState();
}

class _CallInvitationPageState extends State<CallInvitationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZegoSendCallInvitationButton(
      isVideoCall: true,
      resourceID: 'zegouikit_call',
      iconSize: const Size(40, 40),
      buttonSize: const Size(50, 50),
      invitees: [
        ZegoUIKitUser(
          id: widget.patient.id,
          name: widget.patient.name,
        ),
      ],
    );
  }
}