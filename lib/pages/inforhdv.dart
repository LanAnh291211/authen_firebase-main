import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import '../helper/helper_function.dart';
import '../service/database_service.dart';
import '../widgets/custom_select_date_time.dart';



const List<String> listselect = <String>['Đi đến trường', 'Đi về nhà'];

class SelectAdressPage extends StatefulWidget {
  const SelectAdressPage({super.key});

  @override
  State<SelectAdressPage> createState() => _SelectAdressPageState();
}

class _SelectAdressPageState extends State<SelectAdressPage> {
  String userName = "";
  Stream? users, groups;
   List userList = [];
bool isShowPersons = false;
  String email = "";
  DateTime selectedDateTime = DateTime.now();
  DateTime selectedDateTime1 = DateTime.now();

  final addresscontroller = TextEditingController();
  DetailsResult? startPosition;
  late FocusNode startFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    gettingUserData();
    String apiKey = '';
    googlePlace = GooglePlace(apiKey);

    startFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startFocusNode.dispose();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
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
    //get i
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Thông tin chuyến đi")),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Điểm Du lịch'),
              TextField(
                controller: addresscontroller,
                autofocus: false,
                focusNode: startFocusNode,
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(
                    hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    suffixIcon: addresscontroller.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                predictions = [];
                                addresscontroller.clear();
                              });
                            },
                            icon: const Icon(Icons.clear_outlined),
                          )
                        : null),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 1000), () {
                    if (value.isNotEmpty) {
                      //places api
                      autoCompleteSearch(value);
                    } else {
                      //clear out the results
                      setState(() {
                        predictions = [];
                        startPosition = null;
                      });
                    }
                  });
                },
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        predictions[index].description.toString(),
                      ),
                      onTap: () async {
                        final placeId = predictions[index].placeId!;
                        final details = await googlePlace.details.get(placeId);
                        if (details != null && details.result != null && mounted) {
                          if (startFocusNode.hasFocus) {
                            setState(() {
                              startPosition = details.result;
                              addresscontroller.text = details.result!.name!;
                              predictions = [];
                            });
                          }
                        }
                      },
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              const Text('Thời gian bắt đầu:'),
              CustomSelectDateTime(
                onSelectDayTimeConfirm: (date) {
                  selectedDateTime = date;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Thời gian kết thúc:'),
              CustomSelectDateTime(
                onSelectDayTimeConfirm: (date) {
                  selectedDateTime1 = date;
                },
              ),

              const SizedBox(
                height: 20,
              ),
          
              const SizedBox(
                height: 20,
              ),
              const Text('Chú thích:'),
              TextFormField(
                decoration: const InputDecoration(),
              ),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton.icon(
              //     onPressed: () {
              //       final docUser = FirebaseFirestore.instance.collection('users_send').doc();

              //       final user = Userss(
              //           email: email,
              //           fullName: userName,
              //           location: addresscontroller.text,
              //           // get id of u
              //           uid: FirebaseAuth.instance.currentUser!.uid,
              //           date: Timestamp.fromDate(selectedDateTime));
              //       createUser(user, docUser);

              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => SuccessPage(
              //                   text: 'yêu cầu thành công',
              //                 )),
              //       );
              //     },
              //     icon: const Icon(Icons.send),
              //     label: const Text("Gửi yêu cầu")),

              // a button
              ElevatedButton.icon(
                  onPressed: () {

                    setState(() {
                      isShowPersons = true;
                    });
                    // final userss= snapshot.data ?? [];
                    // // user = snapshot.data where location = locationController
                    //  userList = addresscontroller == null ? userss : userss.where((element) => element.location == addresscontroller.text).toList();
                  },
                  icon: const Icon(Icons.send),
                  label: const Text("Lưu thông tin")),

            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


}



// Future createUser(Userss user, DocumentReference docUser) async {
//   final userJson = user.toJson();
//   await docUser.set(userJson);
// }

// class Userss {
//   final String? fullName;
//   final String? email;
//   String? location;
//   String? profilePic;
//   String? uid;

//   final Timestamp? date;

//   Userss({
//     this.fullName = '',
//     this.email = '',
//     this.location = '',
//     this.profilePic = '',
//     this.uid = '',
//     this.date,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       "fullName": fullName,
//       "email": email,
//       "location": location,
//       "profilePic": "",
//       "uid": uid,
//       'date': date,
//     };
//   }

//   static Userss fromJson(Map<String, dynamic> json) {
//     return Userss(
//       fullName: json['fullName'],
//       email: json['email'],
//       location: json['location'],
//       profilePic: json['profilePic'],
//       uid: json['uid'],
//       date: json['date'],
//     );
//   }
// }
