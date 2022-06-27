import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_qrcode_scanner/flutter_qrcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_beep/flutter_beep.dart';

bool go = false;
const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class AddBoyPro extends StatefulWidget {
  const AddBoyPro({Key? key}) : super(key: key);

  @override
  _AddBoyProState createState() => _AddBoyProState();
}

class _AddBoyProState extends State<AddBoyPro> {
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool fleshBoll = true;
  bool cameraCH = false;
  bool viewer = false;
  bool cemeraPP = false;
  bool nameCheck = false;
  double kachuVjanTotal = 0;
  double tayarVjanTotal = 0;
  double totalPAR = 0;
  String code1 = "";
  String code2 = "";
  List kachahira = [];
  List tayarhira = [];
  List parlist = [];
  List vish = [];
  List<TextEditingController> controllerTlist = [];
  TextEditingController kachuVajanT = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 215, 239, 255),
        toolbarHeight: 40,
        title: const Text("Galaxy Scan"),
        titleTextStyle: GoogleFonts.lato(fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.black, fontSize: 25),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _keyboardIsVisible()
              ? Container()
              : Expanded(
                  flex: 1,
                  // child: Container(
                  //   color: Colors.amber,
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(10),
                          // borderRadius: const BorderRadius.only(
                          // bottomLeft: Radius.circular(10.0),
                          // bottomRight: Radius.circular(10.0),
                          // topLeft: Radius.circular(10.0),
                          // topRight: Radius.circular(10.0),
                          // ),
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.0, 1.0),
                            ),
                          ], gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.blueGrey.shade800, Colors.blueGrey.shade800], stops: const [0.0, 1.0])),
                      child: QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                          borderColor: Colors.blueGrey.shade700,
                          borderRadius: 5,
                          borderLength: 20,
                          borderWidth: 5,
                          cutOutSize: 200,
                        ),
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 215, 239, 255), // Button
              child: SizedBox(
                height: 65,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            width: 60,
                            height: 30,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white, // Button color
                              child: InkWell(
                                borderRadius: BorderRadius.circular(17),
                                splashColor: fleshBoll ? Colors.green : Colors.red, // Splash color
                                onTap: () {
                                  if (controller != null) {
                                    controller.toggleFlash();
                                    if (_isFlashOn(flashState)) {
                                      setState(() {
                                        flashState = flashOff;
                                        fleshBoll = false;
                                      });
                                    } else {
                                      setState(() {
                                        flashState = flashOn;
                                        fleshBoll = true;
                                      });
                                    }
                                  }
                                },
                                child: SizedBox(
                                    child: fleshBoll
                                        ? const Icon(
                                            CupertinoIcons.brightness,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            CupertinoIcons.brightness_solid,
                                            color: Colors.black,
                                          )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            width: 60,
                            height: 30,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white, // Button color
                              child: InkWell(
                                borderRadius: BorderRadius.circular(17),
                                splashColor: Colors.green,
                                // Splash color
                                onTap: () {
                                  if (cemeraPP) {
                                    controller.resumeCamera();
                                    cemeraPP = false;
                                    setState(() {});
                                  } else {
                                    controller.resumeCamera();
                                    cemeraPP = true;
                                    setState(() {});
                                  }
                                },
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: cemeraPP
                                        ? const Icon(
                                            CupertinoIcons.refresh,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            CupertinoIcons.refresh,
                                            color: Colors.black,
                                          )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            width: 60,
                            height: 30,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.white, // Button color
                              child: InkWell(
                                borderRadius: BorderRadius.circular(17),
                                splashColor: Colors.red,
                                // Splash color
                                onTap: () {
                                  kachahira.removeRange(0, kachahira.length);
                                  tayarhira.removeRange(0, kachahira.length);
                                  parlist.removeRange(0, kachahira.length);
                                  vish.removeRange(0, kachahira.length);
                                  totalPAR = 0.0;
                                  kachuVjanTotal = 0.0;
                                  tayarVjanTotal = 0.0;
                                  setState(() {});
                                },
                                child: Center(
                                  child: Text(
                                    "Clear All",
                                    style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "ટોટલ પેકેટ =",
                                style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  kachahira.length.toString(),
                                  style: GoogleFonts.lato(fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.black, fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'કાચું વજન',
                                  style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'તૈયાર વજન',
                                  style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '%',
                                  style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: viewer
                    ? Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: kachahira.isNotEmpty ? kachahira.length : 0,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Material(
                                          color: Colors.white,
                                          elevation: 3,
                                          borderRadius: BorderRadius.circular(8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Visibility(
                                                        visible: vish[index] == "0" ? true : false,
                                                        child: Text(
                                                          '${kachahira[index]}',
                                                          style: GoogleFonts.lato(fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.black, fontSize: 15),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: vish[index] == "1" ? true : false,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Theme(
                                                          data: ThemeData(
                                                              textSelectionTheme: const TextSelectionThemeData(
                                                            cursorColor: Colors.black,
                                                            selectionColor: Colors.green,
                                                            selectionHandleColor: Colors.black,
                                                          )),
                                                          child: TextFormField(
                                                            textInputAction: TextInputAction.next,
                                                            controller: controllerTlist[index],
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                                                              LengthLimitingTextInputFormatter(10),
                                                            ],
                                                            textAlign: TextAlign.center,
                                                            textAlignVertical: TextAlignVertical.center,
                                                            style: GoogleFonts.lato(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 15),
                                                            cursorWidth: 0.8,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (vish[index] == "0") {
                                                            vish[index] = "1";
                                                            controllerTlist[index].value = TextEditingValue(text: kachahira[index]);
                                                          } else {
                                                            vish[index] = "0";

                                                            kachahira[index] = controllerTlist[index].text.toString();
                                                            String vajan = controllerTlist[index].text.toString();
                                                            kachahira[index] = vajan;

                                                            setState(() {});
                                                            kachuVjanTotal = 0;
                                                            double par = double.parse(tayarhira[index]) * 100 / double.parse(kachahira[index]);
                                                            parlist[index] = par.toStringAsFixed(2);
                                                            setState(() {});
                                                            double totalpar = 0;
                                                            for (var i = 0; i < kachahira.length; i++) {
                                                              kachuVjanTotal = kachuVjanTotal + double.parse(kachahira[i]);

                                                              setState(() {});
                                                            }
                                                            double partotal = (tayarVjanTotal) * 100 / (kachuVjanTotal);
                                                            totalPAR = partotal;

                                                            setState(() {});
                                                          }
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(40.0),
                                                            child: vish[index] == "0"
                                                                ? const ImageIcon(
                                                                    AssetImage("assets/photos/pencil.png"),
                                                                    color: Color.fromARGB(255, 168, 207, 233),
                                                                  )
                                                                : const ImageIcon(
                                                                    AssetImage("assets/photos/dune.png"),
                                                                    color: Color.fromARGB(255, 99, 189, 129),
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 15,
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    '${tayarhira[index]}',
                                                    style: GoogleFonts.lato(fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.black, fontSize: 15),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 15,
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    '${parlist[index]}',
                                                    style: GoogleFonts.lato(fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.black, fontSize: 15),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: InkWell(
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(9.0),
                                                      child: ImageIcon(
                                                        AssetImage("assets/photos/minus.png"),
                                                        color: Color.fromARGB(255, 185, 4, 4),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    tayarVjanTotal = tayarVjanTotal - double.parse(tayarhira[index]);
                                                    kachuVjanTotal = kachuVjanTotal - double.parse(kachahira[index]);
                                                    double partotal = (tayarVjanTotal) * 100 / (kachuVjanTotal);
                                                    totalPAR = partotal;
                                                    setState(() {});
                                                    kachahira.removeAt(index);
                                                    tayarhira.removeAt(index);
                                                    parlist.removeAt(index);
                                                    vish.removeAt(index);
                                                    controllerTlist.removeAt(index);
                                                    if (kachahira.length == 0) {
                                                      kachuVjanTotal = 0.0;
                                                      tayarVjanTotal = 0.0;
                                                      totalPAR = 0.0;
                                                      viewer = false;
                                                    } else {
                                                      // double totalpar = 0;
                                                      // // setState(() {});

                                                      // for (var i = 0; i < kachahira.length; i++) {
                                                      //   // checkCode(context, code2);
                                                      //   totalpar = totalpar + double.parse(parlist[i]);
                                                      //   setState(() {
                                                      //     totalPAR = totalpar / kachahira.length;
                                                      //   });
                                                      // }
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  "Scan QR code",
                                  style: GoogleFonts.lato(fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Icon(
                                  Icons.qr_code,
                                  color: Color.fromARGB(255, 215, 239, 255),
                                  size: 50,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 1,
              color: Color.fromARGB(255, 215, 239, 255),
              borderRadius: BorderRadius.circular(10),

              // B
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                kachuVjanTotal.toStringAsFixed(4),
                                style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                tayarVjanTotal.toStringAsFixed(4),
                                style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                totalPAR.toStringAsFixed(3),
                                style: GoogleFonts.lato(fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      Timer(const Duration(milliseconds: 700), () {
        controller.resumeCamera();
      });
      setState(() {
        qrText = scanData;
        if (qrText.isNotEmpty) {
          FlutterBeep.playSysSound(43);

          var v1 = "", v2 = "";
          List<String> parts;
          parts = qrText.split(',');
          v1 = parts[7].trim();
          v2 = parts[8].trim();

          if (qrText != "") {
            viewer = true;
            double par = double.parse(v2) * 100 / double.parse(v1);
            kachahira.add("$v1");
            tayarhira.add("$v2");
            vish.add("0");
            controllerTlist.add(TextEditingController());
            parlist.add(par.toStringAsFixed(4));
            kachuVjanTotal = kachuVjanTotal + double.parse(v1);
            tayarVjanTotal = tayarVjanTotal + double.parse(v2);
            // double totalpar = 0;
            double partotal = (tayarVjanTotal) * 100 / (kachuVjanTotal);

            // for (var i = 0; i < kachahira.length; i++) {
            //   // kachuVjanTotal = kachuVjanTotal + double.parse(kachahira[i]);
            //   // tayarVjanTotal = tayarVjanTotal + double.parse(tayarhira[i]);

            //   // checkCode(context, code2);
            //   totalpar = totalpar + double.parse(parlist[i]);
            //   setState(() {});
            // }
            totalPAR = partotal;
          } else {
            viewer = false;
          }
          qrText = v1 + "==" + v2;

          print("==========" + qrText);
          cemeraPP = true;

          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showToast0(BuildContext context, String s1, String color1) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          "$s1",
          style: GoogleFonts.lato(shadows: [
            Shadow(
              blurRadius: 1.0,
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ], fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.white, fontSize: 15),
        ),
        backgroundColor: color1 == "0" ? Colors.redAccent : Colors.green,
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }
}

void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
  ('${DateTime.now().toIso8601String()}_onPermissionSet $p');
  if (!p) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('no Permission')),
    );
  }
}
