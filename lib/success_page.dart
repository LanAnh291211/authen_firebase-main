import 'package:flutter/material.dart';

import 'app.dart';
import 'main_page.dart';
import 'select_adress_page.dart';

const List<String> list = <String>['Người chở', 'Chọn vị trí'];
String text1 = list.first;

class SuccessPage extends StatefulWidget {
  SuccessPage({super.key, this.text});
  String? text;

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: DropdownButtonExample()),
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
      body: text1 == 'Người chở' ? persons() : Container(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column persons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Search here',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 164,
                  width: 164,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Container(
                    height: 108,
                    width: 108,
                    decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Yêu cầu thành công',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
             widget.text!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 90,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Đóng',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.location_on),
                const SizedBox(
                  width: 5,
                ),
                const Text('Ngô SĨ liên, ĐN'),
              ],
            ),
            Row(
              children: [],
            )
          ],
        ),
      ],
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
        });

        switch (value) {
          case 'Người chở':
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigationBarExampleApp()),
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
