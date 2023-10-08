import 'package:authen_firebase/forgot_password.dart';
import 'package:authen_firebase/otp.dart';
import 'package:authen_firebase/pages/landing/index.dart';
import 'package:authen_firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_config/flutter_config.dart';

import 'app.dart';
import 'main_page.dart';
import 'pages/auth/login_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterConfig.loadEnvVariables();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      print(emailController.text);
    });
    passwordController.addListener(() {
      print(passwordController.text);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                // return Column(
                //   mainAxisSize: MainAxisSize.min,

                //   children: [
                //     Text("Welcome ${snapshot.data!.email}"),
                //     MainPage(),
                //     ElevatedButton.icon(onPressed: () async {
                //       await FirebaseAuth.instance.signOut();
                //     }, icon: Icon(Icons.lock_open), label: Text("Đăng xuất")),

                //   ],
                // );
                // return MainPage(
                //   name: "${snapshot.data!.email}",
                //   onPressed: () async {
                //     await FirebaseAuth.instance.signOut();
                //   },
                // );
                return BottomNavigationBarExampleApp();
              }

              return LandingPage();

              // return Column(
              //   children: [
              //     TextField(
              //       controller: emailController,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'Email',
              //       ),
              //     ),
              //     TextField(
              //       controller: passwordController,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(),
              //         labelText: 'Mật khẩu',
              //       ),
              //     ),
              //     ElevatedButton.icon(onPressed: signIn, icon: Icon(Icons.lock_open), label: Text("Sign In")),
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
              //       },
              //       child: Text("quên mật khẩu? "),
              //     ),
              //     Row(
              //       children: [
              //         Text("Chưa có tài khoản? "),
              //         TextButton(
              //             onPressed: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              //             },
              //             child: Text("Đăng ký"))
              //       ],
              //     )
              //   ],
              // );
            }),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
  }
}
