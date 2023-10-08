import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class SelectTimeDialog extends StatelessWidget {
  final dynamic onPressed;
  final DateTime innittime;
  final DateTime? minDate;
  final DateTime? maxDate;
  const SelectTimeDialog({Key? key, this.onPressed, required this.innittime, this.maxDate, this.minDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime mock = innittime;
    return Center(
      child: Container(
        height: 264,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(13)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 212,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (value) {
                  mock = value;
                },
                initialDateTime: innittime,
                minimumYear: 1,
                minimumDate: minDate,
                maximumDate: maxDate,
                minuteInterval: 15,
              ),
            ),
            const Divider(
              height: 2,
              color: AppColors.black,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Button(
                      title: 'Cancel',
                      style: FlatButtonStyles.unstyleButton,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    child: Button(
                      title: 'OK',
                      style: FlatButtonStyles.unstyleButton,
                      onPressed: () => onPressed(mock),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
