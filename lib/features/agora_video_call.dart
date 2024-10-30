//t2 Core Packages Imports
import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class AgoraVideoCall extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const AgoraVideoCall({
    super.key,
  });

  @override
  State<AgoraVideoCall> createState() => _AgoraVideoCallState();
}

class _AgoraVideoCallState extends State<AgoraVideoCall> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  //t2 --Controllers
  //
  //t2 --State
  //t2 --State
  //
  //t2 --Constants
  //t2 --Constants
  //!SECTION
  Future<String> fetchAgoraToken() async {
    final url =
    Uri.parse('https://agora-token-server-3lvw.onrender.com/getToken');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "tokenType": "rtc",
        "channel": "Test-channel",
        "role": "subscriber",
        "uid": "user123",
        "expire": 3600
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("the token is ${data['token']}");
      return data['token'];
    } else {
      throw Exception('Failed to fetch token: ${response.statusCode}');
    }
  }
  Future<AgoraClient> _initAgora() async {
    // final String token = await fetchAgoraToken();
    final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: '95e06577911441ae9d54d6c88340a72a',
          channelName: 'Test-channel',
// tempToken: token
      tokenUrl: 'https://agora-token-server-3lvw.onrender.com/getToken',
          // tempToken: '007eJxSYJhiIsV8NKF6Wab1qk3bfs39YhK4ftvLfpOVLCWdiX3zJTwVGCxNUw3MTM3NLQ0NTUwME1MtU0xNUsySLSyMTQwSzY0S21sV0wX4GBj8rrMyMzJAIIjPwxCSWlyim5yRmJeXmsPOUFqcWmRoZAwIAAD//9ctIfY='
        // tempToken: '007eJxTYJD/Y7zihI+7XoRct9ryp3wcttd+7Dg5z/qne6CQOz9rXokCg6VpqoGZqbm5paGhiYlhYqpliqlJilmyhYWxiUGiuVFiorFiekMgI8P+e8eZGBkgEMTnZkjLKS0pSS0qSS0uYWAAAFwTH9Q=',
      ),
    );
    print("Current client ${client.agoraConnectionData.toString()}");

    print("Current token ${client.agoraConnectionData.tempToken}");
    await client.initialize();
    return client;
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
            future: _initAgora(),
            builder: (context, agoraClient) {
              if (agoraClient.connectionState == ConnectionState.done) {
                if (agoraClient.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return SafeArea(
                    child: Stack(
                      children: [
                        AgoraVideoViewer(
                          client: agoraClient.data!,
                          layoutType: Layout.floating,
                          showNumberOfUsers: true,
                        ),
                        AgoraVideoButtons(
                          client: agoraClient.data!,
                          enabledButtons: const [
                            BuiltInButtons.toggleCamera,
                            BuiltInButtons.callEnd,
                            BuiltInButtons.toggleMic,
                          ],
                        )
                      ],
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
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
