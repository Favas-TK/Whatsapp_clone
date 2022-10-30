import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat_screen/models/chat_model.dart';
import 'package:whatsapp_clone/chat_screen/models/single_chat_model.dart';
import 'package:whatsapp_clone/chat_screen/pages/chatbubble.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({super.key, required this.datas});
  User datas;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final _mesaageController = TextEditingController();
  FocusNode focusNode=FocusNode();

  bool showSend = false;
  bool showEmoji = false;
  //final _chatController = TextEditingController();
  List<SingleChat> bubble = [
    SingleChat(isSend: true, isReaded: true, message: 'hoi', sendAt: '3:00 pm'),
    SingleChat(
        isSend: false, isReaded: true, message: 'kereevada', sendAt: '4:00 pm'),
    SingleChat(
        isSend: true,
        isReaded: false,
        message: 'haaaa maaan',
        sendAt: '9:00 am'),
    SingleChat(
        isSend: false, isReaded: false, message: 'irangeda', sendAt: '5:00 pm'),
    SingleChat(
        isSend: false, isReaded: true, message: 'poyeenedo', sendAt: '3:00 pm'),
    SingleChat(
        isSend: true, isReaded: true, message: 'goman goo ', sendAt: '8:00 pm'),
  ];
  void setbubble() {
    // SingleChat(
    //   isSend: true,
    //   isReaded: false,
    //   message: _mesaageController.text,
    // );

    var datetime = DateTime.now();
    setState(() {
      var time = '${datetime.hour}:${datetime.minute}pm';
      bubble.add(SingleChat(
          isSend: true,
          isReaded: true,
          message: _mesaageController.text,
          sendAt: time));
      _mesaageController.clear();
    });
  }

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
            CircleAvatar(
              backgroundImage: widget.datas.profile == ''
                  ? AssetImage(widget.datas.isGroup!
                      ? 'assets/images/group.png'
                      : 'assets/images/icon.png') as ImageProvider<Object>
                  : NetworkImage(widget.datas.profile!),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.datas.name.toString()),
            Text(widget.datas.updatedAt.toString())
          ],
        ),
        actions: [
          const Icon(Icons.video_call),
          const SizedBox(width: 20),
          const Icon(Icons.call_end),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text(
                      widget.datas.isGroup! ? 'Group info' : 'View contact')),
              PopupMenuItem(
                  child: Text(widget.datas.isGroup!
                      ? 'Group media'
                      : 'Media,links,and docs')),
              const PopupMenuItem(child: Text('Search')),
              const PopupMenuItem(child: Text('Mute Notifications')),
              const PopupMenuItem(child: Text('Disappearing mesages')),
              const PopupMenuItem(child: Text('Wallpaper')),
              const PopupMenuItem(child: Text('More')),
            ];
          })
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/origi.jpeg',
              width: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            ListView.builder(
              itemCount: bubble.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  data: bubble[index],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            focusNode: focusNode,
                              onTap: () {
                                setState(() {
                                  showEmoji = false;
                                });
                              },
                              controller: _mesaageController,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    showSend = true;
                                  });
                                } else {
                                  setState(() {
                                    showSend = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Message',
                                prefixIcon: IconButton(
                                  icon: Icon(showEmoji
                                      ? Icons.keyboard
                                      : Icons.emoji_emotions_outlined),
                                  onPressed: () {
                                    setState(() {
                                      showEmoji = !showEmoji;
                                      showEmoji?FocusManager.instance.primaryFocus
                                          ?.unfocus():focusNode.requestFocus();
                                    });
                                  },
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) => menu());
                                        },
                                        icon: const Icon(Icons.attach_file)),
                                    const Icon(Icons.currency_rupee_rounded),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.camera_alt_rounded),
                                    const SizedBox(width: 10)
                                  ],
                                ),
                              )),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setbubble();
                        },
                        child:
                            Icon(showSend ? Icons.send : Icons.keyboard_voice),
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: !showEmoji,
                    child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        textEditingController: _mesaageController,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container menu() {
    return Container(
      height: 300,
      color: const Color.fromARGB(221, 207, 196, 196),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: const Icon(Icons.insert_drive_file),
                    text: 'document',
                    color: const Color.fromARGB(255, 82, 35, 224)),
                iconWidget(
                    icon: const Icon(Icons.camera_alt),
                    text: 'Camera',
                    color: const Color.fromARGB(255, 199, 6, 125)),
                iconWidget(
                    icon: const Icon(Icons.photo),
                    text: 'Gallery',
                    color: Colors.purple),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: const Icon(Icons.headset),
                    text: 'Audio',
                    color: const Color.fromARGB(255, 216, 102, 9)),
                iconWidget(
                    icon: const Icon(Icons.location_pin),
                    text: 'Location',
                    color: const Color.fromARGB(255, 2, 53, 3)),
                iconWidget(
                    icon: const Icon(Icons.currency_rupee),
                    text: 'Payment',
                    color: const Color.fromARGB(255, 70, 107, 71)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: iconWidget(
                    icon: const Icon(Icons.perm_contact_calendar),
                    text: 'Contact',
                    color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column iconWidget({
    String? text,
    Icon? icon,
    Color? color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: icon,
        ),
        const SizedBox(height: 10),
        Text(text!)
      ],
    );
  }
}

// Widget selectemoji(){
//   return EmojiPicker(onEmojiSelected: (emoji, category) {
    
//   },);
// }
