import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'helper/helper_function.dart';
import 'main_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'select_adress_page.dart';
import 'service/auth_service.dart';
import 'service/database_service.dart';
import 'widgets/widgets.dart';

const List<String> list = <String>['Người chở', 'Chọn vị trí'];
String text1 = list.first;

class RequiredPage extends StatefulWidget {
  const RequiredPage({super.key});

  @override
  State<RequiredPage> createState() => _RequiredPageState();
}

class _RequiredPageState extends State<RequiredPage> {
  String email = "";
  String groupName = "";
  Stream? users, groups;
  String id2 = '';
  String userName = "";
  String userName2 = '';
  AuthService authService = AuthService();


  bool _isLoading = false;

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
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).getUserGroups().then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
    //getting the list of user
    // await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email).then((snapshot) {
    //   setState(() {
    //     users = snapshot;
    //   });
    // });
  }

  persons() {
    // return StreamBuilder<List<UserRequired>>(
    //     stream: getUsers(),
    //     builder: (context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    //         if (snapshot.data['users'].length == 0) {
    //           return const Center(child: Text("Không có người yêu cầu"));
    //         } else {
    //           final users = snapshot.data;
    //           return ListView.builder(
    //             itemCount: users.length,
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 padding: const EdgeInsets.all(20),
    //                 // height: 171,
    //                 decoration: BoxDecoration(
    //                   color: Colors.grey[200],
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Column(
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: [
    //                     ListTile(
    //                       title: Text(users[index].fullName),
    //                       subtitle: Text(users.email),
    //                       leading: const CircleAvatar(
    //                         radius: 30,
    //                         backgroundImage: NetworkImage('https://fastly.picsum.photos/id/9/200/300'),
    //                       ),
    //                       // trailing: ElevatedButton(
    //                       //   onPressed: () {
    //                       //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeChatPage()));
    //                       //   },
    //                       //   child: const Text("Nhận"),
    //                       // ),
    //                     ),
    //                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //                       TextButton(
    //                           onPressed: () {
    //                             popUpDialog(context);

    //                             Navigator.push(
    //                               context,
    //                               MaterialPageRoute(builder: (context) => const HomeChatPage()),
    //                             );
    //                           },
    //                           style: ButtonStyle(
    //                             backgroundColor: MaterialStateProperty.all(Colors.green),
    //                           ),
    //                           child: const Text(
    //                             'Đồng ý',
    //                             style: TextStyle(color: Colors.white),
    //                           )),
    //                       const SizedBox(
    //                         width: 15,
    //                       ),
    //                       TextButton(
    //                           onPressed: () {

    //                           },
    //                           style: ButtonStyle(
    //                             backgroundColor: MaterialStateProperty.all(Colors.red),
    //                           ),
    //                           child: const Text(
    //                             'Hủy',
    //                             style: TextStyle(color: Colors.white),
    //                           )),
    //                     ])
    //                   ],
    //                 ),
    //               );
    //             },
    //           );
    //         }
    //       } else {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //       // return Column(
    //       //   mainAxisSize: MainAxisSize.min,
    //       //   children: [
    //       //     const Text("Danh sách người yêu cầu"),
    //       //     const SizedBox(height: 30),

    //       //     Flexible(
    //       //       child: ListView.separated(
    //       //           separatorBuilder: (context, index) {
    //       //             return const SizedBox(
    //       //               height: 15,
    //       //             );
    //       //           },
    //       //           itemCount: 10,
    //       //           shrinkWrap: true,
    //       //           itemBuilder: (context, index) {
    //       //             return Container(
    //       //               padding: const EdgeInsets.all(20),
    //       //               // height: 171,
    //       //               decoration: BoxDecoration(
    //       //                 color: Colors.grey[200],
    //       //                 borderRadius: BorderRadius.circular(10),
    //       //               ),
    //       //               child: Column(
    //       //                 mainAxisSize: MainAxisSize.min,
    //       //                 children: [
    //       //                   ListTile(
    //       //                     title: const Text('Nguyễn Văn A'),
    //       //                     subtitle: const Text('Ngô Sĩ liên ĐN'),
    //       //                     leading: const CircleAvatar(
    //       //                       radius: 30,
    //       //                       backgroundImage: NetworkImage('https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI'),
    //       //                     ),
    //       //                     trailing: IconButton(
    //       //                       icon: const Icon(Icons.more_horiz),
    //       //                       onPressed: () {},
    //       //                     ),
    //       //                   ),
    //       //                   Row(
    //       //                     children: [
    //       //                       const SizedBox(
    //       //                         width: 15,
    //       //                       ),
    //       //                       const Icon(Icons.location_on),
    //       //                       const SizedBox(
    //       //                         width: 5,
    //       //                       ),
    //       //                       const Text('Ngô Sĩ liên ĐN'),
    //       //                     ],
    //       //                   ),
    //       //                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       //                     TextButton(
    //       //                         onPressed: () {
    //       //                           popUpDialog(context);

    //       //                           Navigator.push(
    //       //                             context,
    //       //                             MaterialPageRoute(builder: (context) => HomeChatPage()),
    //       //                           );
    //       //                         },
    //       //                         style: ButtonStyle(
    //       //                           backgroundColor: MaterialStateProperty.all(Colors.green),
    //       //                         ),
    //       //                         child: const Text(
    //       //                           'Đồng ý',
    //       //                           style: TextStyle(color: Colors.white),
    //       //                         )),
    //       //                     const SizedBox(
    //       //                       width: 15,
    //       //                     ),
    //       //                     TextButton(
    //       //                         onPressed: () {},
    //       //                         style: ButtonStyle(
    //       //                           backgroundColor: MaterialStateProperty.all(Colors.red),
    //       //                         ),
    //       //                         child: const Text(
    //       //                           'Hủy',
    //       //                           style: TextStyle(color: Colors.white),
    //       //                         )),
    //       //                   ]),
    //       //                 ],
    //       //               ),
    //       //             );
    //       //           }),
    //       //     ),
    //       //   ],
    //       // );
    //     });
  }

  popUpDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
              title: const Text(
                "Tạo một nhóm chat",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                        )
                      : TextField(
                          onChanged: (val) {
                            setState(() {
                              groupName = val;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor), borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor), borderRadius: BorderRadius.circular(20))),
                        ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed:  () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                  child: const Text("Hủy"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (groupName != "") {
                      setState(() {
                        _isLoading = true;
                      });
                      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                          .createGroup(userName, FirebaseAuth.instance.currentUser!.uid, id2, userName2, groupName)
                          .whenComplete(() {
                        _isLoading = false;
                      });
                      Navigator.of(context).pop();
                      showSnackbar(context, Colors.green, "Tạo nhóm thành công");
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                  child: const Text("Tạo"),
                )
              ],
            );
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Center(child: DropdownButtonExample()),
      
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
        child: StreamBuilder<List<UserRequired>>(
            stream: getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("error");
                print(snapshot.error);

                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final users = snapshot.data ?? [];
             
              return Container(
                color: (users.any((element) => element.isSelected == true)) ? Colors.grey : Colors.white,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    var user = users[index];
                    id2 = user.uid ?? '';
                    userName2 = user.fullName ?? '';
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(user.fullName ?? ""),
                          subtitle: Text(user.location ?? ""),
                          
                          leading: const CircleAvatar(
                            radius: 30,
                            // backgroundImage: NetworkImage('https://fastly.picsum.photos/id/9/200/300'),
                          ),
                          // trailing: ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeChatPage()));
                          //   },
                          //   child: const Text("Nhận"),
                          // ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          
                          TextButton(
                              onPressed:   (users.every((element) => element.isSelected == false)) ?  () {
                                final docUser = FirebaseFirestore.instance.collection('users').doc(user.uid);
              
                                user =
                                    UserRequired(uid: user.uid, fullName: user.fullName, email: user.email, location: user.location, profilePic: user.profilePic, isSelected: true,date: user.date);
              
                                update(user, docUser);
              
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeChatPage(
                                            id2: id2,
                                            userName2: userName2,
                                          )),
                                );
                              } : null,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green),
                              ),
                              child: const Text(
                                'Đồng ý',
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          
                          TextButton(
                              onPressed: (users.every((element) => element.isSelected == false)) ? () {
                                deleteUser(user.uid!);
                              } : null,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                              ),
                              child: const Text(
                                'Hủy',
                                style: TextStyle(color: Colors.white),
                              )),
                        ]),
                      ],
                    );
                  },
                ),
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
          text1 = value;
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

void deleteUser(String id) {
  FirebaseFirestore.instance.collection('users_required').doc(id).delete();
}

Stream<List<UserRequired>> getUsers() {
  return FirebaseFirestore.instance.collection('users_required').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final user = UserRequired.fromJson(doc.data());
      return user;
    }).toList();
  });
}

Future update(UserRequired user, DocumentReference docUser) async {
  // await docUser.update(user.toJson());

  // await docUser.update(user.toJson());
  print("cccc${user.isSelected}");
  await docUser.update(user.toJson()).then((_) {
    print("success!");
  });
}

class UserRequired {

  UserRequired({
    this.fullName = '',
    this.email = '',
    this.location = '',
    this.profilePic = '',
    this.isSelected = false,
    this.uid = '',
    required this.date
  });

  final String? email;
  final String? fullName;
  bool? isSelected;
  String? location;
  String? profilePic;
  String? uid;
  final Timestamp date;


  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "location": location,
      "profilePic": "",
      "isSelected": isSelected,
      "uid": uid,

      'date': date,
    };
  }

  static UserRequired fromJson(Map<String, dynamic> json) {
    return UserRequired(
      fullName: json['fullName'],
      email: json['email'],
      location: json['location'],
      profilePic: json['profilePic'],
      isSelected: json['isSelected'],
      uid: json['uid'],
      date: json['date'],
    );
  }
}
