import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status_screen/models/status_model.dart';

class StatusTile extends StatelessWidget {
   StatusTile({
    Key? key,
    required this.statusdata
  }) : super(key: key);
  Staatus statusdata;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title:Text (statusdata.name!),
      subtitle: Text(statusdata.updatedAt!),
      
    );
  }
}
