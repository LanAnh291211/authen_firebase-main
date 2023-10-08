import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'helper/helper_function.dart';
import 'pages/auth/login_page.dart';
import 'pages/profile_page.dart';
import 'person_required_page.dart';
import 'select_adress_page.dart';
import 'service/auth_service.dart';
import 'success_page.dart';
import 'widgets/slider_banner.dart';
import 'widgets/widgets.dart';

final f = DateFormat('yyyy-MM-dd hh:mm a');

const List<String> list = <String>['Người chở', 'Chọn vị trí'];

class MainPage extends StatefulWidget {
  MainPage({super.key, this.name, this.onPressed});
  String? name;
  void Function()? onPressed;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthService authService = AuthService();
  String userName = "";
  String email = "";
   TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    // getting the list of snapshots in our stream
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Center(child: DropdownButtonExample()),
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),

        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RequiredPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.grey[700],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            userName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {},
            selectedColor: Theme.of(context).primaryColor,
            selected: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Các nhóm",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(
                  context,
                  ProfilePage(
                    userName: userName,
                    email: email,
                  ));
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "trang cá nhân",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Đăng xuất"),
                      content: const Text("Bạn có chắc muốn đăng xuát"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await authService.signOut();
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  });
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Đăng xuất",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      )),
      body: persons(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => SelectAdressPage()),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  persons() {
    return StreamBuilder<List<Userss>>(
        stream: getUsers(),
        builder: (context, snapshot) {
          final users = snapshot.data ?? [];
          // user = snapshot.data where location = locationController

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SliderBanner(),
              // Text('Xin chào ${widget.name}!!'),

              // ElevatedButton.icon(
              //     onPressed: widget.onPressed,

              //     icon: Icon(Icons.lock_open),
              //     label: Text("Đăng xuất")),

            
              const SizedBox(height: 30),
              Flexible(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: users.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var user = users[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        // height: 171,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(user.fullName ?? ''),
                              subtitle: Text(f.format(user.date.toDate()) ?? ''),
                              leading: const CircleAvatar(
                                radius: 30,
                                // backgroundImage: NetworkImage('https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI'),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_horiz),
                                onPressed: () {},
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(Icons.location_on),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(user.location ?? ''),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  final docUser = FirebaseFirestore.instance.collection('users_required').doc();
                                  final userRequired = UserRequired(
                                    email: user.email,
                                    date: user.date,
                                    fullName: user.fullName,
                                    location: user.location,
                                    profilePic: user.profilePic,
                                    uid: docUser.id,
                                  );
                                  createUser(userRequired, docUser);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SuccessPage(
                                              text: 'yêu cầu thành công chờ đối phương xác nhận',
                                            )),
                                  );
                                },
                                child: const Icon(Icons.send)),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        });
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });

        switch (value) {
          case 'Người chở':
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            }
            break;
          case 'Chọn vị trí':
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectAdressPage()),
              );
            }
            break;
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Stream<List<Userss>> getUsers() {
  return FirebaseFirestore.instance.collection('users_send').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final user = Userss.fromJson(doc.data());
      return user;
    }).toList();
  });
}

Future update(Userss user, DocumentReference docUser) async {
  // await docUser.update(user.toJson());

  // await docUser.update(user.toJson());
  print("cccc${user.location}");
  await docUser.update(user.toJson()).then((_) {
    print("success!");
  });
}

Future createUser(UserRequired user, DocumentReference docUser) async {
  final userJson = user.toJson();
  await docUser.set(userJson);
}

class Userss {
  final String? fullName;
  final String? email;
  String? location;
  String? profilePic;
  String? uid;

  final Timestamp date;

  Userss({this.fullName = '', this.email = '', this.location = '', this.profilePic = '', this.uid = '', required this.date});

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "location": location,
      "profilePic": "",
      "uid": uid,
      'date': date,
    };
  }

  static Userss fromJson(Map<String, dynamic> json) {
    return Userss(
      fullName: json['fullName'],
      email: json['email'],
      location: json['location'],
      profilePic: json['profilePic'],
      uid: json['uid'],
      date: json['date'],
    );
  }
}
