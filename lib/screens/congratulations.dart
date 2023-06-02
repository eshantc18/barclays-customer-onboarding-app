import 'package:customer_onboard/screens/home.dart';
import 'package:flutter/material.dart';

class Congo extends StatelessWidget {
  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Image.asset('assets/congratulations.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                child: Text(
                  'Congratulations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Account Setup Completed'),
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 10, 15),
                child: SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () => goToHome(context),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 7,
                    ),
                    child: Text(
                      'Next',
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
