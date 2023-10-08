import 'dart:async';

import 'package:authen_firebase/a.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    isEmailVerified = user.emailVerified;
    if(!isEmailVerified) {
      sendVerificationEmail();
     timer = Timer.periodic(Duration(seconds: 5), (timer) {

      checkIsVerify();
     });

    }



    //   sendVerificationEmail();

    // });
    // _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    // if(!_isEmailVerified) {
    //  sendVerificationEmail();
    // }
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    user = auth.currentUser!;
    isEmailVerified = user.emailVerified;
  
    await user.sendEmailVerification();
  }

  Future<void> checkIsVerify() async {
    user = auth.currentUser!;
    await user.reload();
    
    setState(() {
      isEmailVerified = user.emailVerified;
    });
 


    
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                child: Text('Verify Email to ${user.email}'),
              ),
            ],
          );
  }
}
