
//  import 'package:email_auth/email_auth.dart';
// import 'package:flutter/material.dart';

// class OTP extends StatefulWidget {
//   //OTP({Key? key}) : super(key: key);
//   @override
//   _OTPState createState() => _OTPState();
// }

// class _OTPState extends State<OTP> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _optcontroller = TextEditingController();

//   void sendOTP() async {
//     EmailAuth emailAuth = new EmailAuth(sessionName: "Test Session");
//     var res = await emailAuth.sendOtp(
//         recipientMail: _emailController.value.text, otpLength: 6);
//     if (res) {
//       print("Verification Code Sent!");
//     } else {
//       print("Failed to send the verification code");
//     }
//   }

//   void verifyOTP() {
//     EmailAuth emailAuth = new EmailAuth(sessionName: "sessionName");
//     var res = emailAuth.validateOtp(
//         recipientMail: _emailController.value.text,
//         userOtp: _optcontroller.value.text);
//     if (res) {
//       print("Email Verified!");
//     } else {
//       print("Invalid Verification Code");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("VERIFY YOUR UNIVERSITY"),
//       ),
//       body: Column(
//         children: [
//           Text("Please enter your",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text("college/university email address",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//             color: Colors.black38,
//           ),
//         ),
//         SizedBox(
//           height: 38,
//         ),
//         TextField(
//           controller: _emailController,
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             hintText: "Enter email",
//             ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: sendOTP,
//             style: ButtonStyle(
//               foregroundColor: 
//                 MaterialStateProperty.all<Color>(Colors.purple),
//               backgroundColor: 
//                 MaterialStateProperty.all<Color>(Colors.orange),
//               shape: 
//                 MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(24),
//               ),
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(14),       
//             child: Text(
//             'send the code',
//             style: TextStyle(fontSize: 16),
//             ),
//           ),
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         TextField(
//           controller: _optcontroller,
//           keyboardType: TextInputType.number,
//           obscureText: true,
//           decoration: InputDecoration(
//             hintText: "Enter the 6 digit code",
//             labelText: "Verification Code",
//             ),
//           ),
//         SizedBox(
//           height: 30.0,
//         ),
//         ElevatedButton(
//           child: Text("Verify Code"),
//           onPressed: () => verifyOTP())
//         ],
//       ),
//     );
//   }
// }