import 'package:customer_onboard/screens/identityProof.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer_onboard/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:customer_onboard/screens/OTP.dart';

class PhoneVerification extends StatefulWidget {
  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  var otp;
  var verifID;

  void sendOTP({phoneNo}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (phoneAuthCredential) async {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
      },
      codeSent: (String? verificationID, int? resendCode) {
        verifID = verificationID.toString();
      },
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  void logIN() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifID, smsCode: otpController.text);

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Identity()));
  }

  void goToOTP() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Identity()),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Image.asset('assets/verification.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Center(
                child: Text(
                  'Verify Phone No.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 10, 15),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        '+91',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 15),
                    child: SizedBox(
                      width: 270,
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Phone No.',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 15),
                child: SizedBox(
                  width: 330,
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'OTP No.',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 10, 15),
                child: SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () => sendOTP(phoneNo: {phoneController.text}),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                    ),
                    child: Text(
                      'Send OTP',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 10, 15),
                child: SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () => goToOTP(),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                    ),
                    child: Text(
                      'Verify',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
}
