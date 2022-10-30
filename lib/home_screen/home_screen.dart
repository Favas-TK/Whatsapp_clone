import 'package:flutter/material.dart';
import 'package:whatsapp_clone/call_screen/call_screen.dart';
import 'package:whatsapp_clone/camera/camera_screen.dart';
import 'package:whatsapp_clone/chat_screen/chat_screen.dart';
import 'package:whatsapp_clone/status_screen/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _control;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _control = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          const Icon(Icons.search),
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('New group')),
                PopupMenuItem(child: Text('New broadcast')),
                PopupMenuItem(child: Text('Linked devices')),
                PopupMenuItem(child: Text('Starred messages')),
                PopupMenuItem(child: Text('Payments')),
                PopupMenuItem(child: Text('Settings')),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _control,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _control,
        children: [
          const CameraScreen(),
          ChatScreen(),
          StausScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}
