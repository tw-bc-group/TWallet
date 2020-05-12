import 'dart:io';

import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tw_wallet_ui/global/common/application.dart';

class QrScannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QrScannerPageState();
}

class QrScannerPageState extends State<QrScannerPage>
    with WidgetsBindingObserver {
  ScannerController _scannerController;

  Future<bool> checkAndRequirePermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (!status.isGranted) {
      if (Platform.isIOS && !status.isUndetermined) {
        return showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: Text("需要去应用设置页面允许相机权限"),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.pop(context);
                    await openAppSettings();
                  },
                  child: Text("去设置"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("拒绝"),
                ),
              ],
            );
          },
        );
      } else {
        await Permission.camera.request();
      }
    }
    return await Permission.camera.isGranted;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(Duration(milliseconds: 500)).then((_) {
        checkAndRequirePermission().then((isGranted) {
          if (isGranted) {
            _scannerController.startCamera();
            _scannerController.startCameraPreview();
          } else {
            Navigator.pop(context, null);
          }
        });
      });
    });

    WidgetsBinding.instance.addObserver(this);
    _scannerController = ScannerController(
      scannerResult: (String result) {
        Navigator.pop(context, result);
      },
    );
  }

  @override
  void dispose() {
    _scannerController.stopCameraPreview();
    _scannerController.stopCamera();
    super.dispose();
  }

  @override
  void deactivate() {
    if (_scannerController.isStartCameraPreview) {
      _scannerController.stopCameraPreview();
    } else {
      _scannerController.startCameraPreview();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.grey[800];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double borderWidth = constraints.maxWidth * 2 / 3;
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  child: PlatformAiBarcodeScannerWidget(
                    platformScannerController: _scannerController,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth / 6,
                    top: constraints.maxHeight / 4,
                    right: constraints.maxWidth / 6,
                    bottom: constraints.maxHeight -
                        (constraints.maxHeight / 4 + borderWidth),
                  ),
                  width: borderWidth,
                  height: borderWidth,
                  child: _recognitionBorder(
                    borderWidth: borderWidth,
                    borderHeight: borderWidth,
                  ),
                ),
                Positioned(
                    top: 15,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: RaisedButton(
                                color: buttonColor,
                                shape: CircleBorder(),
                                child: Icon(Icons.close, color: Colors.white),
                                onPressed: () =>
                                    Application.router.pop(context)),
                          ),
//                          Expanded(child: Container()),
//                          RaisedButton(
//                              color: buttonColor,
//                              shape: CircleBorder(),
//                              child:
//                                  Icon(Icons.photo_album, color: Colors.white),
//                              onPressed: () => {}),
//                          Container(
//                            padding: EdgeInsets.only(right: 10),
//                            child: RaisedButton(
//                                color: buttonColor,
//                                shape: CircleBorder(),
//                                child: Icon(
//                                    _scannerController.isOpenFlash
//                                        ? Icons.flash_off
//                                        : Icons.flash_on,
//                                    color: Colors.white),
//                                onPressed: () {
//                                  setState(() {
//                                    _scannerController.toggleFlash();
//                                  });
//                                }),
//                          ),
                        ],
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _recognitionBorder({
    @required double borderWidth,
    @required double borderHeight,
  }) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      var lineStrokeWidth = 5.0;

      return Container(
        width: borderWidth,
        height: borderHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: borderWidth / 3,
                height: lineStrokeWidth,
                color: Colors.green,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: borderWidth / 3,
                color: Colors.green,
                height: lineStrokeWidth,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: borderWidth / 3,
                color: Colors.green,
                height: lineStrokeWidth,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: borderWidth / 3,
                color: Colors.green,
                height: lineStrokeWidth,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: borderHeight / 3,
                color: Colors.green,
                width: lineStrokeWidth,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: borderHeight / 3,
                color: Colors.green,
                width: lineStrokeWidth,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: borderHeight / 3,
                color: Colors.green,
                width: lineStrokeWidth,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: borderHeight / 3,
                color: Colors.green,
                width: lineStrokeWidth,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
