import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../share_ui/shared_ui.dart';
import 'widgets/button_parent_painter.dart';
import 'widgets/button_sitter_painter.dart';

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({
    Key? key,
    this.token,
    this.parentStatus,
    this.sitterStatus,
  }) : super(key: key);

  final String? token;
  final String? parentStatus;
  final String? sitterStatus;

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  late String sitterStatus;
  late String parentStatus;

  @override
  void initState() {
    super.initState();
    sitterStatus = widget.sitterStatus ?? 'inactive';
    parentStatus = widget.parentStatus ?? 'inactive';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Users>>(
        stream: getUsers(),
        builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            leading: const LeadingButton(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Bắt đầu nào', style: TextStyles.title24SemiBold),
                  const SizedBox(height: 8),
                  Text(
                    'Chọn một trong hai vai trò để bắt đầu',
                    style: TextStyles.smallBody16Regular.copyWith(color: AppColors.textQuarternary),
                  ),
                  const SizedBox(height: 39),
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            onTap: ()  {
                              showCustomDialog(context, '');
                            },
                            child: CustomPaint(
                              painter: ButtonSitterPainter(color: AppColors.backgroundPrimary),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 30),
                                width: double.infinity,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Hướng dẫn viên',
                                        style: TextStyles.title22Regular.copyWith(color: AppColors.tintBlue).copyWith(fontSize: 28),
                                      ),
                                      const Svg(
                                        height: 150,
                                        svgPath: SvgPath.sitter,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            // onTap: () => showCustomDialog(context, ''),
                            onTap: () {
                               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  BottomNavigationBarExample()),
                  );
                            },
                            child: CustomPaint(
                              painter: ButtonParentPainter(color: AppColors.backgroundPrimary),
                              child: Container(
                                padding: const EdgeInsets.only(top: 15),
                                width: double.infinity,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Svg(
                                        height: 150,
                                        svgPath: SvgPath.parent,
                                      ),
                                      Text(
                                        'Khách du lịch',
                                        style: TextStyles.title22Regular.copyWith(color: AppColors.tintRed).copyWith(fontSize: 28),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Future<void> showCustomDialog(BuildContext context, String message) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext buildContext) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              color: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Tạo 1 tài khoản Khách du lịch ',
                      style: TextStyles.largeBody18SemiBold,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Tạo 1 tài khoản Khách du lịch để có thể tìm kiếm và đặt lịch với các Hướng dẫn viên',
                      style: TextStyles.smallBody16Regular,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Button(
                            title: 'Trở về',
                            style: FlatButtonStyles.unstyleButton,
                            onPressed: () {
                              Navigator.of(buildContext).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Button(
                            title: 'Tạo',
                            style: FlatButtonStyles.primary,
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
  Stream<List<Users>> getUsers() {
  return FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final user = Users.fromJson(doc.data());
      return user;
    }).toList();
  });
}
}
class Users {
  final String? fullName;
  final String? email;
  String? role;
  String? profilePic;
  String? uid;


  Users({this.fullName = '', this.email = '', this.role = '', this.profilePic = '', this.uid = ''});

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "location": role,
      "profilePic": "",
      "uid": uid,
      
    };
  }

  static Users fromJson(Map<String, dynamic> json) {
    return Users(
      fullName: json['fullName'],
      email: json['email'],
      role: json['location'],
      profilePic: json['profilePic'],
      uid: json['uid'],
    );
  }
}