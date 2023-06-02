import 'package:flutter/material.dart';

class navigationDrawer extends StatelessWidget {
  final user;
  navigationDrawer(this.user);
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 30, 15, 15),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/bank.png'),
                    radius: 45,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Title(
                    color: Colors.white,
                    child: Text(
                      user.email == null ? 'xyz' : user.email!,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home_outlined, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wallet_rounded, color: Colors.white),
                    title: Text(
                      'Transactions',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.card_membership, color: Colors.white),
                    title: Text(
                      'Cards',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent, color: Colors.white),
                    title: Text(
                      'Support',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer, color: Colors.white),
                    title: Text(
                      'FAQs',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback_rounded, color: Colors.white),
                    title: Text(
                      'Feedback',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text(
                      'About Us',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
