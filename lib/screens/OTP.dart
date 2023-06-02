import 'package:customer_onboard/screens/identityProof.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTP extends StatefulWidget {
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  void goToI() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Identity()),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Image.asset('assets/verification.png'),
                ),
              ),
              Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    'A six-digit code has been sent to the registered mobile number'),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Kindly enter the code to continue.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 2.5, 0),
                      child: SizedBox(
                        width: 50,
                        child: TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                      child: SizedBox(
                        width: 50,
                        child: TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 1,

                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                      child: SizedBox(
                        width: 50,
                        child: TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 1,

                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                      child: SizedBox(
                        width: 50,
                        child: TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 1,

                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                      child: SizedBox(
                        width: 50,
                        child: TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 1,

                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(2.5, 0, 20, 0),
                      child: SizedBox(
                        width: 50,
                        child: TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend OTP',
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 10, 15),
                  child: SizedBox(
                    width: 330,
                    child: ElevatedButton(
                      onPressed: () => goToI(),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 7,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
