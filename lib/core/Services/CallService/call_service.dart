// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_uikit/agora_uikit.dart';
//
// import '../../../constants.dart';
//
// class CallService {
//   RtcEngine? _engine;
//   late AgoraClient client;
//
//   Future<void> initAgoraService({required String userID, required String userName}) async {
//     // Initialize Agora client
//     client = AgoraClient(
//       agoraConnectionData: AgoraConnectionData(
//         // todo change app ID
//         appId: "${Constants.appID}",
//         // appCertificate: Constants.appSign, // Agora doesn’t use appSign, consider using token if security is needed
//         channelName: "test_channel", // You can set this dynamically
//         username: userName,
//       ),
//       enabledPermission: [Permission.camera, Permission.microphone],
//       agoraEventHandlers: AgoraRtcEventHandlers(
//       ),
//     );
//
//     // Initialize Agora Engine
//     _engine = await RtcEngine.initialize();
//
//     _engine = await RtcEngine.initialize(Constants.appID);
//     await _engine!.setChannelProfile(ChannelProfileType.channelProfileCommunication);
//
//     // Set the role as broadcaster for video calls
//     await _engine!.setClientRole( role: ClientRoleType.clientRoleBroadcaster);
//   }
//
//   Future<void> startCall({required bool isGroupCall, required bool isVideoCall}) async {
//     // Set call configuration based on type
//     if (isGroupCall) {
//       if (isVideoCall) {
//         client = client.copyWith(
//           agoraClientRoleType: AgoraClientRole.Broadcaster,
//           agoraVideoViewerConfig: AgoraVideoViewerConfig(
//             showAVStateIcon: true,
//           ),
//         );
//       } else {
//         await _engine!.disableVideo();
//       }
//     } else {
//       if (isVideoCall) {
//         await _engine!.enableVideo();
//       } else {
//         await _engine!.disableVideo();
//       }
//     }
//
//     // Additional UI configurations
//     // _showCustomButtons();
//   }
//
//   // void _showCustomButtons() {
//   //   client = client.copyWith(
//   //     agoraVideoViewerConfig: AgoraVideoViewerConfig(
//   //       // Add buttons like minimizing or sound effect
//   //       topMenuBarConfig: AgoraTopMenuBarConfig(
//   //         isVisible: true,
//   //         buttons: [
//   //           AgoraTopMenuBarButton.minimize,
//   //           AgoraTopMenuBarButton.soundEffect,
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
