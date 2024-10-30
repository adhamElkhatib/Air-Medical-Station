import 'package:air_medical_station/theme.dart';
import 'package:air_medical_station/util.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'core/Services/App/app.service.dart';
import 'core/Services/Auth/AuthService.dart';
import 'core/Services/Firebase/firebase.service.dart';
import 'features/authentication/presentation/pages/landing.screen.dart';
import 'features/home/presentation/pages/home.screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await App.initialize(AppEnvironment.dev);
  await FirebaseService.initialize();
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  // call the useSystemCallingUI
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MyApp(navigatorKey: navigatorKey));
  });
// runApp(MyApp(navigatorKey: navigatorKey));

}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}


class MyAppState  extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      navigatorKey: widget.navigatorKey,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: theme.light().colorScheme,
        textTheme: textTheme,
      ),
      // highContrastTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: theme.lightHighContrast().colorScheme,
      //   textTheme: textTheme,
      // ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: theme.dark().colorScheme,
      //   textTheme: textTheme,
      // ),
      // highContrastDarkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: theme.darkHighContrast().colorScheme,
      //   textTheme: textTheme,
      // ),
      home: StreamBuilder(
        stream: AuthService().isUserLoggedIn(),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LandingScreen();
          }
        },
      ),    );
  }
}


