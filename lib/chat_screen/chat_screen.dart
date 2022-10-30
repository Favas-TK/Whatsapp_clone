import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat_screen/chat_tile.dart';
import 'package:whatsapp_clone/chat_screen/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});

  List <User> users = [
    User(name: 'favas',messages: 'hello',isGroup: false,profile: 'https://wallpapercave.com/wp/wp2566164.jpg',updatedAt: '3pm'),
    User(name: 'friendforever',isGroup: true,messages: 'hey all',profile: 'https://wallpapercave.com/wp/wp2553454.jpg',updatedAt: '6am'),
    User(name: 'annan',isGroup: false,messages: 'Makkaleeey',profile: 'https://i0.wp.com/nypost.com/wp-content/uploads/sites/2/2018/07/180718-zuckerberg.jpg?quality=90&strip=all&ssl=1',updatedAt:'8pm'),
    User(name: 'daverevoli',isGroup: false,messages: 'nallath cheythaal nallath kittum',profile: 'https://i.ytimg.com/vi/jsPYO6GoBOQ/hqdefault.jpg',updatedAt: 'online'),
    User(name: 'allkeralafreaks',isGroup: true,messages: 'hey teams',profile: 'https://th.bing.com/th/id/R.c859798b17f10cc16599aaaefed743be?rik=74HinMb%2bLk6Tfw&riu=http%3a%2f%2f3.bp.blogspot.com%2f-0x-z5agoxAE%2fUtwA83TvONI%2fAAAAAAAABHM%2fyyjqLUjHEC0%2fs1600%2ffreakers%2bof%2bkerala.jpg&ehk=ZyKkrcV3RClQuVVhmpijOueFQZzJMFn63UJZns7roeQ%3d&risl=&pid=ImgRaw&r=0',updatedAt: '8pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return  ChatTile(userData:
          users[index]) ;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.message),
      ),
    );
  }
}

