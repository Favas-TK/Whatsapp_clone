import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat_screen/models/chat_model.dart';
import 'package:whatsapp_clone/chat_screen/pages/innner_page.dart';

class ChatTile extends StatelessWidget {
   ChatTile({
    Key? key,
    required this.userData
  }) : super(key: key);
  User userData;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatDetail(datas: userData),)),
      leading: CircleAvatar(
        backgroundImage:(userData.profile== '' ) 
        ?  AssetImage(userData.isGroup!? 'assets/images/group.png': 'assets/images/icon.png')
        as ImageProvider<Object>?
        :NetworkImage(userData.profile!),
      ),
      title: Text(userData.name!),
      subtitle: Text(userData.messages!),
      trailing: Text(userData.updatedAt!),
    );
  }
}
