import 'package:authen_firebase/main_page.dart';
import 'package:authen_firebase/pages/home_parent_chat.dart';
import 'package:authen_firebase/select_adress_page.dart';
import 'package:authen_firebase/webview.dart';
import 'package:flutter/material.dart';

import 'person_required_page.dart';
import 'share_ui/shared_ui.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomNavigationBarExampleApp extends StatelessWidget {
   BottomNavigationBarExampleApp({super.key,this.name, this.onPressed});
  String? name;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    RequiredPage(),
    SelectAdressPage(),
     HomeChatPage(),
    const WebViewPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyles.caption10Regular,
         currentIndex: _selectedIndex,
        unselectedLabelStyle: TextStyles.caption10Regular,
        selectedItemColor: AppColors.secondary,
        items: [
          AppBottomNavigationBarItem(
            svgPath: SvgPath.calendarSolid,
            label: 'Schedule',
            selectedItemColor: AppColors.secondary,
          ),
          AppBottomNavigationBarItem(
            svgPath: SvgPath.briefcase,
            label: 'Jobs',
            selectedItemColor: AppColors.secondary,
          ),
          AppBottomNavigationBarItem(
            svgPath: SvgPath.messageText,
            label: 'Chat',
            selectedItemColor: AppColors.secondary,
          ),
          AppBottomNavigationBarItem(
            svgPath: SvgPath.user,
            label: 'Weather',
            selectedItemColor: AppColors.secondary,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
