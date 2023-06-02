import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Image.asset('assets/address_proof.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
