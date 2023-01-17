import 'dart:math';
import 'package:flutter/material.dart';

import 'live_screen.dart';


/// Note that the userID needs to be globally unique,
final String localUserID = Random().nextInt(10000).toString();

class LiveStreamingScreen extends StatefulWidget {
  const LiveStreamingScreen({Key? key}) : super(key: key);

  @override
  State<LiveStreamingScreen> createState() => _LiveStreamingScreenState();
}

class _LiveStreamingScreenState extends State<LiveStreamingScreen> {


  /// Users who use the same liveID can join the same live streaming.
  final liveTextCtrl =
  TextEditingController(text: Random().nextInt(10000).toString());

  jumpToLivePage(BuildContext context,
      {required String liveID, required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivePage(liveID: liveID, isHost: isHost),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var buttonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(120, 60),
      backgroundColor: const Color(0xff2C2F3E).withOpacity(0.6),
    );

    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID:$localUserID'),
            const Text('Please test with two or more devices'),
            TextFormField(
              controller: liveTextCtrl,
              decoration: const InputDecoration(labelText: "join a live by id"),
            ),
            const SizedBox(height: 20),
            // click me to navigate to LivePage
            ElevatedButton(
              style: buttonStyle,
              child: const Text('Start a live'),
              onPressed: () => jumpToLivePage(
                context,
                liveID: liveTextCtrl.text,
                isHost: true,
              ),
            ),
            const SizedBox(height: 20),
            // click me to navigate to LivePage
            ElevatedButton(
              style: buttonStyle,
              child: const Text('Watch a live'),
              onPressed: () => jumpToLivePage(
                context,
                liveID: liveTextCtrl.text,
                isHost: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



