import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nc_flutter_threads/constants/gaps.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;

  bool _isSelfieMode = false;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 100),
  );
  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.1).animate(_buttonAnimationController);

  late FlashMode _flashMode;
  late CameraController _cameraController;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController.initialize();

    // only for ios
    await _cameraController.prepareForVideoRecording();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _startTakingPhoto() async {
    if (_cameraController.value.isTakingPicture) return;

    _buttonAnimationController.forward();
    var image = await _cameraController.takePicture();
    _buttonAnimationController.reverse();
    Navigator.of(context).pop([image.path]);
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _cameraController.dispose();

    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await initCamera();
      setState(() {});
    }
  }

  Future<void> _onPickPhotoPressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;
    if (!mounted) return;

    Navigator.of(context).pop([image.path]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: !_hasPermission || !_cameraController.value.isInitialized
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Initializing...",
                      style: TextStyle(
                          color: Colors.white, fontSize: Sizes.size20),
                    ),
                    Gaps.v20,
                    CircularProgressIndicator.adaptive()
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  Sizes.size32,
                                ),
                                bottomRight: Radius.circular(
                                  Sizes.size32,
                                ),
                              ),
                            ),
                            child: CameraPreview(_cameraController),
                            clipBehavior: Clip.hardEdge,
                          ),
                          Positioned(
                            bottom: Sizes.size40,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.flash_off_rounded,
                                      size: Sizes.size32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _startTakingPhoto,
                                  child: ScaleTransition(
                                    scale: _buttonAnimation,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: Sizes.size80 + Sizes.size10,
                                          height: Sizes.size80 + Sizes.size10,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: Sizes.size8,
                                            value: 1.0,
                                          ),
                                        ),
                                        Container(
                                          width: Sizes.size72,
                                          height: Sizes.size72,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: _toggleSelfieMode,
                                    icon: Icon(
                                      Icons.cameraswitch,
                                      size: Sizes.size32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Sizes.size80,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Camera',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: _onPickPhotoPressed,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Library',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: Sizes.size18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
