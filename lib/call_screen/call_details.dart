import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call_screen/models/call_model.dart';

class CallDetails extends StatelessWidget {
  CallDetails({super.key, required this.calls});
  Calling calls;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 90,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          title: const Text('Call info'),
          actions: [
            const Icon(Icons.message),
            PopupMenuButton(itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('Remove from call log')),
                PopupMenuItem(child: Text('Block')),
              ];
            }),
          ]),
      body: Container(
        decoration: BoxDecoration(border: Border.all(width: .5)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(calls.profile!),
          ),
          title: Text(calls.name.toString()),
          subtitle: const Text('busy'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.call),
              Icon(Icons.videocam),
            ],
          ),
        ),
      ),
    );
  }
}
