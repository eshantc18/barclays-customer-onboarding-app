import 'package:customer_onboard/screens/home.dart';
import 'package:customer_onboard/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intropages extends StatelessWidget {
  void goToLogin(context) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Home();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  return Login();
                },
              )));

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      controlsPadding: EdgeInsets.all(10),
      done: const Text('Login'),
      onDone: () => goToLogin(context),
      showDoneButton: true,
      skip: const Text('Skip'),
      onSkip: () => goToLogin(context),
      showSkipButton: true,
      next: Icon(Icons.arrow_forward_ios_sharp),
      showNextButton: true,
      pages: [
        PageViewModel(
          title: 'Investment Banking',
          body: 'Smart Banking with easy onboarding',
          image: Image.asset(
            'assets/page_01.png',
            height: 200,
            width: 200,
          ),
          decoration: PageDecoration(
            imagePadding: EdgeInsets.fromLTRB(60, 50, 0, 0),
            imageFlex: 1,
            imageAlignment: Alignment.bottomCenter,
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          title: 'Investment Banking',
          body: 'Smart Banking with easy onboarding',
          image: Image.asset(
            'assets/page_02.png',
            height: 200,
            width: 200,
          ),
          decoration: PageDecoration(
            imagePadding: EdgeInsets.fromLTRB(60, 50, 0, 0),
            imageFlex: 1,
            imageAlignment: Alignment.bottomCenter,
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          title: 'Investment Banking',
          body: 'Smart Banking with easy onboarding',
          image: Image.asset(
            'assets/page_03.png',
            height: 200,
            width: 200,
          ),
          decoration: PageDecoration(
            imagePadding: EdgeInsets.fromLTRB(60, 50, 0, 0),
            imageFlex: 1,
            imageAlignment: Alignment.bottomCenter,
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
            pageColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
