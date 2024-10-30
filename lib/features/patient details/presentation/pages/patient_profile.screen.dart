//t2 Core Packages Imports
import 'package:air_medical_station/Data/Repositories/user.repo.dart';
import 'package:air_medical_station/features/patient%20details/presentation/pages/view_basic_info.screen.dart';
import 'package:air_medical_station/features/patient%20details/presentation/pages/view_health_metrics.screen.dart';
import 'package:air_medical_station/features/patient%20details/presentation/pages/view_health_summary.screen.dart';
import 'package:air_medical_station/features/patient%20details/presentation/pages/view_shared_medical_records.screen.dart';
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../Data/Model/Patient/patient.dart';
import '../../../../constants.dart';
import '../../../../core/Services/Auth/AuthService.dart';
import '../../../call/presentation/widgets/call_invitation_widget.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class PatientProfileScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  final Patient patient;

  //!SECTION
  //
  const PatientProfileScreen({
    super.key,
    required this.patient,
  });

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen>
    with SingleTickerProviderStateMixin {
  //
  //SECTION - State Variables
  //t2 --Controllers
  late FormController formController;
  late TabController tabController;

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
    formController = FormController();
    tabController = TabController(length: 4, vsync: this);
    initializeZegoCall();
    //t2 --Controllers & Listeners
    //
    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }
  Future<void> initializeZegoCall() async {
    AppUser? appUser = await AppUserRepo().readSingle(AuthService().getCurrentUserId());
    print("intializeZegoCall");
    try {
      if (ZegoUIKitPrebuiltCallInvitationService().isInit) {
        await ZegoUIKitPrebuiltCallInvitationService().uninit();
      }

      await ZegoUIKitPrebuiltCallInvitationService().init(
        appID: Constants.appID,
        appSign: Constants.appSign,
        userID: AuthService().getCurrentUserId(),
        userName: appUser!=null ? "DR/${appUser.name}" :"Your Doctor",
        plugins: [ZegoUIKitSignalingPlugin()],
        invitationEvents: ZegoUIKitPrebuiltCallInvitationEvents(
          onIncomingCallReceived:
              (callID, caller, callType, callees, customData) {
            print("Printing Date:");
            print("callID: $callID");
            print("caller name: ${caller.name}");
            print("caller id: ${caller.id}");

            print("callees: ${callees}");
            print("customData: ${customData}");
          },
        ),
        // events: ZegoUIKitPrebuiltCallEvents().user.,
        notificationConfig: ZegoCallInvitationNotificationConfig(
          androidNotificationConfig: ZegoCallAndroidNotificationConfig(
            showFullScreen: true,
          ),
          iOSNotificationConfig: ZegoCallIOSNotificationConfig(
            systemCallingIconName: 'CallKitIcon',
          ),
        ),
        requireConfig: (ZegoCallInvitationData data) {
          final config = (data.invitees.length > 1)
              ? ZegoCallInvitationType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
              : ZegoCallInvitationType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

          // config.avatarBuilder = customAvatarBuilder;
          /// support minimizing, show minimizing button
          config.topMenuBar.isVisible = true;
          config.topMenuBar.buttons
              .insert(0, ZegoCallMenuBarButtonName.minimizingButton);
          return config;
        },
      );
      print(
          "Initialization successful for selectedPatient ID:");
      ("selectedPatient is null, cannot initialize Zego call service.");

    } catch (e) {
      print("Error initializing Zego call service: $e");
    }
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
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //     onPressed: (){
          //   Navigator.push(context,  MaterialPageRoute<void>(
          //     builder: (BuildContext context) => const AgoraVideoCall(),
          //   ),);
          // },
          //     icon: const Icon(Icons.video_call_outlined)
          // ),

          CallInvitationWidget(
            patient: widget.patient,
          ),
        ],
        centerTitle: true,
        title: Text(
          "Patient Profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          backgroundImage: NetworkImage(
                            widget.patient.imageUrl!,
                          ),
                          radius: 24,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.patient.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.patient.dateOfBirth}Y",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${widget.patient.height}CM",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${widget.patient.weight}KG",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: TabBar(
                  controller: tabController,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'Basic info'),
                    Tab(text: 'Health Summary'),
                    // Tab(text: 'Consult History'),
                    Tab(text: 'Health Metrics'),
                    Tab(text: 'Shared Medical Records'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        // Disable swipe gestures
        children: [
          ViewBasicInfoScreen(patient: widget.patient),
          ViewHealthSummaryScreen(patient: widget.patient),
          // ViewConsultHistoryScreen(),
          ViewHealthMetricsScreen(patient: widget.patient),
          ViewSharedMedicalRecordsScreen(patient: widget.patient),
        ],
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
