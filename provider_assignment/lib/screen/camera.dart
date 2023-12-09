import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.camera});
  final List<CameraDescription>? camera;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late FlashMode _flashMode;
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    super.initState();
    _flashMode = FlashMode.off;
    initCamera(widget.camera![0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future toggleFlash() async {
    _flashMode =
        (_flashMode == FlashMode.off) ? FlashMode.torch : FlashMode.off;
    await _cameraController.setFlashMode(_flashMode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            color: CupertinoColors.activeBlue,
            onPressed: () => Navigator.pop(context),
          ),
          middle: const Text(
            'Camera',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Stack(children: [
            (_cameraController.value.isInitialized)
                ? CameraPreview(_cameraController)
                : Container(
                    color: Colors.black,
                    child: const Center(child: CircularProgressIndicator())),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                      color: Colors.black),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          icon: Icon(
                              _isRearCameraSelected
                                  ? CupertinoIcons.switch_camera
                                  : CupertinoIcons.switch_camera_solid,
                              color: Colors.white),
                          onPressed: () {
                            setState(() =>
                                _isRearCameraSelected = !_isRearCameraSelected);
                            initCamera(
                                widget.camera![_isRearCameraSelected ? 0 : 1]);
                          },
                        )),
                        const Spacer(),
                        Expanded(
                            child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          onPressed: () {
                            toggleFlash();
                          },
                          icon: Icon(
                              _flashMode == FlashMode.off
                                  ? CupertinoIcons.moon
                                  : CupertinoIcons.sun_max_fill,
                              color: Colors.white),
                        ))
                      ]),
                )),
          ]),
        ));
  }
}
