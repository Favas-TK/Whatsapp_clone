import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? cameraValue;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController =
        CameraController(cameras[index], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: cameraValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(),
                const Icon(
                  Icons.panorama_fish_eye,
                  size: 100,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      index = index == 0 ? 1 : 1;
                      _cameraController = CameraController(
                          cameras[index], ResolutionPreset.high);
                      cameraValue = _cameraController.initialize();
                    });
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
