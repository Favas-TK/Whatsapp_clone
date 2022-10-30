import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat_screen/models/single_chat_model.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({super.key,required this.data});
  SingleChat data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:data.isSend!? Alignment.centerRight:Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
          color: data.isSend!? const Color(0xffdcf8c6):Colors.white,
          child: Stack(
            children: [
               Padding(
                padding:
                     const EdgeInsets.only(right: 60, left: 10, bottom: 10, top: 10),
                child:  Text(data.message!),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Row(
                  children:  [
                    Text(
                      data.sendAt!,
                      style: const TextStyle(fontSize: 10),
                    ),
                    if(data.isSend!)
                     Icon(
                      Icons.done_all,color: data.isReaded!?Colors.blue:Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
