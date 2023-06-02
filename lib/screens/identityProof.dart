import 'package:customer_onboard/screens/congratulations.dart';
import 'package:flutter/material.dart';

class Identity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IdentityState();
}

class IdentityState extends State<Identity> {
  void goToAddress() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Congo()),
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
              children: [
                Padding(
                  padding: EdgeInsets.all(50),
                  child: Center(
                    child: Image.asset('assets/identity_doc.png'),
                  ),
                ),
                Center(
                  child: Text(
                    'Upload Aadhar Identity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'You can upload any Identity document from the options below, However some require front and back upload. This will help us identify that this is you!'),
                ),
                SizedBox(
                  height: 70,
                  child: const Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 20, 15),
                    child: const SizedBox(
                      width: 330,
                      child: const TextField(
                        // controller: emailorphoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Aadhar No.',
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
                        onPressed: () => goToAddress(),
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
        ),
      ),
    );
  }
}
