import 'package:authen_firebase/widgets/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class CustomSelectDateTime extends StatefulWidget {
  final String label;
  final TextStyle? labelStyle;
  final bool haveCheck;
  final bool haveCheckTime;
  final Function(DateTime)? onSelectDayTimeConfirm; //xuất ngày được chọn ra ngoài widget
  const CustomSelectDateTime({Key? key, this.label = '', this.labelStyle, this.onSelectDayTimeConfirm, this.haveCheck=false,  this.haveCheckTime =false}) : super(key: key);

  @override
  State<CustomSelectDateTime> createState() => _CustomSelectDateTimeState();
}

class _CustomSelectDateTimeState extends State<CustomSelectDateTime> {
  DateTime _selectedDateTime = DateTime.now();
  bool check = true;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: widget.label.isEmpty ? false : true,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    widget.label,
                  )),
            ),
            
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2030, 6, 7),
                          onChanged: (date) {
                            _selectedDateTime = date;
                          },
                          onConfirm: (date) {
                            setState(() {
                              _selectedDateTime = date;
                              widget.onSelectDayTimeConfirm?.call(date); //xuất ngày được chọn ra ngoài widget
                            });
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.en,
                        );
                      },
                      child: Text(
                        _selectedDateTime.formatDateFavorite,
                        style: const TextStyle(color: Colors.black),
                      )),
                  Container(
                    width: 1,
                    height: 17,
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      DatePicker.showTimePicker(
                        context,
                        showTitleActions: true,
                        onChanged: (date) {
                          _selectedDateTime = date;
                        },
                        onConfirm: (date) {
                          setState(() {
                            _selectedDateTime = date;
                            widget.onSelectDayTimeConfirm?.call(date); //xuất ngày được chọn ra ngoài widget
                          });
                        },
                        currentTime: _selectedDateTime,
                      );
                    },
                    child: Text(
                      _selectedDateTime.formatTimeFavorite,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
