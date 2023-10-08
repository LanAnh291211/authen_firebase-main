// import 'package:authen_firebase/verify_email.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController otpEmailController = TextEditingController();
//   EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

//   // var remoteServerConfiguration = {
//   //   "server": "http://127.0.0.1:53229/VyLwxYyCsho=/",
//   //   "serverKey": "UDujOQ",
//   // };

//   void sendOTP() async {
//     print("object");
//     bool result = await emailAuth.sendOtp(recipientMail: emailController.text);
//     if (result) {
//       print("OTP sent");
//     } else {
//       print("OTP not sent");
//     }
//   }

//   void verify() async {
//     var res = emailAuth.validateOtp(recipientMail: emailController.text, userOtp: otpEmailController.text);

//     if (res) {
//       print("OTP Verified");
//     } else {
//       print("OTP not valid");
//     }
//   }

//   final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

//   void showSnack(String title) {
//     final snackbar = SnackBar(
//         content: Text(
//       title,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 15,
//       ),
//     ));
//     scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
//   }

//   final _formkey = GlobalKey<FormState>();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // emailAuth = new EmailAuth(
//   //   //   sessionName: "Sample session",
//   //   // );
//   //   // emailAuth.config(remoteServerConfiguration);

//   // }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldMessenger(
//       key: scaffoldMessengerKey,
//       child: Scaffold(
//           body: StreamBuilder<User?>(
//               stream: FirebaseAuth.instance.authStateChanges(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return /* Column(
//                     children: [
//                       Text("Welcome ${snapshot.data!.email}"),
//                       ElevatedButton.icon(
//                           onPressed: () async {
//                             await FirebaseAuth.instance.signOut();
//                           },
//                           icon: Icon(Icons.lock_open),
//                           label: Text("Sign Out"))
//                     ],
//                   ); */
//                       VerifyEmail();
                      
//                 }
//                 return Form(
//                   key: _formkey,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('Sign Up'),
//                         TextFormField(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           // validator: (value) => value!.isEmpty ? 'Enter an email' : null,
//                           validator: (email) => email != null && !EmailValidator.validate(email) ? 'Hãy nhập 1 email có hiệu lực' : null,
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             hintText: 'Email',
//                           ),
//                         ),
//                         // GestureDetector(
//                         //   child: Text("send otp"),
//                         //   onTap: sendOTP,
//                         // ),
//                         TextFormField(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           // validator: (value) => value!.isEmpty ? 'Enter an email' : null,
//                           validator: (password) => password != null && password.length < 6 ? 'Enter a valid password' : null,
//                           controller: passwordController,
//                           decoration: InputDecoration(
//                             hintText: 'Password',
//                           ),
//                         ),
//                         // TextFormField(
//                         //   autovalidateMode: AutovalidateMode.onUserInteraction,
//                         //   controller: otpEmailController,
//                         //   decoration: InputDecoration(
//                         //     hintText: 'otpEmail',
//                         //   ),
//                         // ),
//                         // GestureDetector(
//                         //   child: Text("verify"),
//                         //   onTap: verify,
//                         // ),
//                         ElevatedButton(
//                           onPressed: signUp,
//                           // onPressed: () {
//                           //   // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyEmail()));
//                           // },
//                           child: Text('Sign Up'),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Already have an account?'),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text('Sign In'),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })),
//     );
//   }

//   Future signUp() async {
//     final isValid = _formkey.currentState!.validate();
//     if (!isValid) return;

//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         });
//     Navigator.of(context, rootNavigator: true).pop();

//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         showSnack('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         //print('The account already exists for that email.');
//         // Utils.showSnackBar('The account already exists for that email.');
//         showSnack('The account already exists for that email.');
//       }
//       //Utils.showSnackBar( e.message!);
//     } catch (e) {
//       print(e);
//     }
//   }
// }
