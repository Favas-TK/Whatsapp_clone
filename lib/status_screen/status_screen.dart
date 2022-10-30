import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status_screen/models/status_model.dart';
import 'package:whatsapp_clone/status_screen/status_tile.dart';

class StausScreen extends StatelessWidget {
  StausScreen({super.key});
  List<Staatus> datas = [
    Staatus(name: 'favas', status: '', updatedAt: '8pm'),
    Staatus(name: 'madhavan', status: '', updatedAt: '7pm'),
    Staatus(name: 'maan', status: '', updatedAt: '9pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return StatusTile(statusdata: datas[index]);
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.grey,
            mini: true,
            onPressed: () {},
            child:const Icon (Icons.edit),
          ),
          SizedBox(height: 10,),
           FloatingActionButton(
            onPressed: () {},
            child:const Icon (Icons.camera_alt),
          ),
        ],
      ),
      
      
    );
  }
}
