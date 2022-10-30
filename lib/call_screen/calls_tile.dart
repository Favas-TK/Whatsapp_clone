import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call_screen/call_details.dart';
import 'package:whatsapp_clone/call_screen/models/call_model.dart';

class CallsTile extends StatelessWidget {
  CallsTile({Key? key, required this.caall}) : super(key: key);
  Calling caall;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  CallDetails(calls: caall),)),
      leading: const CircleAvatar(),
      title: Text(caall.name!),
      subtitle: Row(
        children: [
          Text(caall.updatedAt!),
          caall.isIncoming!? const Icon(Icons.call_received): const Icon(Icons.call_missed_outgoing),
        ],
      ),
      trailing:caall.isVideoCall!?const Icon(Icons.videocam):const Icon(Icons.call),
    );
  }
}
