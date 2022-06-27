import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:http/http.dart' as http;

import 'routes.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  String androidKEY = "";
  bool go = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 247, 247, 247)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: go ? false : true,
              child: Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Account Suspended",
                              style: GoogleFonts.lato(shadows: const [
                                Shadow(
                                  blurRadius: 0.5,
                                  color: Colors.black,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ], fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.red, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: "Please contact the ",
                                  style: GoogleFonts.lato(shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black38,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ], fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 20),
                                ),
                                TextSpan(
                                  text: "DSR ",
                                  style: GoogleFonts.orbitron(shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ], fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.black, fontSize: 25),
                                ),
                                TextSpan(
                                  text: "team\nadmin@dsrsoftech.com",
                                  style: GoogleFonts.lato(shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black38,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ], fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 20),
                                ),
                              ]),
                            ),
                            // Text(
                            //   "Please contact the Facebook team \n info@dsrsoftech.com",
                            //   style: GoogleFonts.lato(
                            //       shadows: [
                            //         Shadow(
                            //           blurRadius: 1.0,
                            //           color: Colors.black,
                            //           offset: Offset(1.0, 1.0),
                            //         ),
                            //       ],
                            //       fontWeight: FontWeight.w400,
                            //       letterSpacing: 1,
                            //       color: Colors.white54,
                            //       fontSize: 20),
                            //   textAlign: TextAlign.center,
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 115,
                        width: 115,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PrettyQr(
                            // image: AssetImage('images/vd.png'),
                            size: 110,
                            data: '$androidKEY',
                            errorCorrectLevel: QrErrorCorrectLevel.M,
                            elementColor: Colors.black,
                            typeNumber: null,
                            roundEdges: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "DSR",
                              style: GoogleFonts.orbitron(fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.black, fontSize: 80),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "MO-7016690991",
                              style: GoogleFonts.lato(shadows: const [
                                Shadow(
                                  blurRadius: 0.5,
                                  color: Colors.black38,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ], fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Copyright 2021 © DSR softech. All Rights Reserved. ",
                              style: GoogleFonts.aBeeZee(
                                  // shadows: [
                                  //   Shadow(
                                  //     blurRadius: 2.0,
                                  //     color: Colors.black,
                                  //     offset: Offset(2.0, 2.0),
                                  //   ),
                                  // ],
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey.shade600,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: go,
              child: Center(
                child: Material(
                  elevation: 2,
                  shadowColor: Color.fromARGB(255, 177, 242, 253),
                  borderRadius: const BorderRadius.all(Radius.circular(85)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "DSR",
                                style: GoogleFonts.orbitron(fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.blueGrey.shade900, fontSize: 60),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Softech",
                                style: GoogleFonts.orbitron(fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.blueGrey.shade900, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
      androidKEY = _deviceData['androidId'];
      chacKarigar(context, androidKEY);
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'androidId': build.androidId,
    };
  }

  chacKarigar(BuildContext context, String clKey) async {
    var uri = Uri.parse("http://dsrsoftech.com/vishal/galaxy_total/auth_check.php");
    Map mapeddate = {
      'cl_key': clKey,
    };

    http.Response reponse = await http.post(uri, body: mapeddate);
    print(reponse);

    //getting response from php code, here
    try {
      var data = await jsonDecode(reponse.body);
      print("data: $data");
      var status = data["status"];
      print("status: $status");
      if (status == 1) {
        String lock = data["lock_cnt"];
        if (lock == "0") {
          go = false;
          setState(() {});
        } else {
          go = false;
          setState(() {});
          await Navigator.pushReplacementNamed(context, MyRoutes.home);
        }
      } else {
        go = false;
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }
}
