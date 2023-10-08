// import 'package:flutter/material.dart';
// const List<String> listselect = <String>['Huỷ', 'Báo cáo'];


// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar:
//           AppBar(title: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [

//               const CircleAvatar(
//                 backgroundImage: NetworkImage('https://i.pinimg.com/originals/7a/0d/0d/7a0d0d8b1b0f1b0e1b0f1b0e1b0f1b0e.jpg'),
//                 radius: 20,
//               ),

//               const Text('Nguyễn Văn A'),
//             ],
//           ), backgroundColor: const Color.fromARGB(255, 14, 58, 38),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.more_vert),
//               onPressed: () {

//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Align(
//                       alignment: Alignment.topLeft,
//                       child: AlertDialog(
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
                    
//                               child: const Text('Hủy'),
                    
//                             ),
//                             const Divider(thickness: 1),
//                             Container(
                    
//                               child: const Text('Báo cáo'),
                    
                    
                    
                    
                    
                    
//                             ),
//                           ],
//                         ),
                       
//                       ),
//                     );
//                   },
//                 );

               



//               },
//             ),
//           ],
//         ),
//         body: Column(

//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,

          

//           children: [

//             Column(children: [

//           ],),


//             TextFormField(
//                         decoration:  const InputDecoration(

//                           //border

                          

                          
//                           hintText: 'Nhập nội dung',
//                           suffixIcon: Icon(Icons.send),
                          
//                         ),
//                       ),
//                     ],


          

         

//         ),

          
//     );
//   }
// }
// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = listselect.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.keyboard_arrow_down),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });

        
//       },
//       items: listselect.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
