import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

import 'package:soundboard/ui/dashboard.dart';

class NewRecording extends StatefulWidget {
  @override
  _NewRecordingState createState() => _NewRecordingState();
}

class _NewRecordingState extends State<NewRecording> {
  final record = AudioRecorder();
  final LocalStorage storage = LocalStorage('soundboard.json');

  // State variables
  String? audioPath;

  @override
  void initState() {
    super.initState();
    record.hasPermission();
    setupStorage();
  }

  void setupStorage() async {
    var value = storage.getItem('sounds');
    if (value == null) {
      storage.setItem('sounds', []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recording'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(),
            ElevatedButton(
              onPressed: () {
                record.start(const RecordConfig(encoder: AudioEncoder.wav),
                    path: "test.wav");
              },
              child: const Text('record?'),
            ),
            ElevatedButton(
              onPressed: () async {
                audioPath = await record.stop();
              },
              child: const Text('stop.'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Convert audio to usable format
                final response = await http.get(Uri.parse(audioPath!));
                final data =
                    Uri.dataFromBytes(response.bodyBytes, mimeType: 'audio/wav')
                        .toString();
                // Save it locally

                var value = storage.getItem('sounds');
                final sounds = value as List;
                sounds.add(data);
                storage.setItem('sounds', sounds);
                // Close this window and return to the previous screen
                Navigator.of(context).pop();
              },
              child: const Text('save!'),
            ),
            ElevatedButton(
              onPressed: () async {
                final player = AudioPlayer();
                await player.setUrl(audioPath!);
                player.play();
              },
              child: const Text('play,'),
            ),
          ],
        ),
      ),
    );
  }
}
