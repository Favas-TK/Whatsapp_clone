import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call_screen/calls_tile.dart';
import 'package:whatsapp_clone/call_screen/models/call_model.dart';

class CallsScreen extends StatelessWidget {
  CallsScreen({super.key});
  List<Calling> dataas = [
    Calling(name: 'favas', isGroup: false, profile: '', updatedAt: '9am',isIncoming: true,isVideoCall: true),
    Calling(name: 'vinayak', isGroup: false, profile: '', updatedAt: '1am',isIncoming: false,isVideoCall: true),
    Calling(name: 'baaba', isGroup: true, profile: '', updatedAt: '8am',isIncoming: true,isVideoCall: false),
    Calling(name: 'yaaya', isGroup: false, profile: '', updatedAt: '3am',isIncoming: false,isVideoCall: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataas.length,
        itemBuilder: (BuildContext context, int index) {
          return CallsTile(caall: dataas[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child:const Icon(Icons.call),
      ),
    );
  }
}
