import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../text_styles/text_styles.dart';

class SitterJobDetailAdditionalInfoSection extends StatelessWidget {
  const SitterJobDetailAdditionalInfoSection({
    super.key,
    required this.listSpecialNote,
    required this.listSpecialNoteTitle,
  });
  final List<String> listSpecialNote;
  final List<String> listSpecialNoteTitle;

  @override
  Widget build(BuildContext context) {
    return _stringIsNotEmptyAndNotSpace(listSpecialNote)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Additional Info',
                style: TextStyles.smallBody16Medium,
              ),
              const SizedBox(height: 8),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: _itemBuilder,
                separatorBuilder: _separatorBuilder,
                itemCount: listSpecialNote.length,
              )
            ],
          )
        : const SizedBox.shrink();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var specialNote = listSpecialNote[index];
    return specialNote.trim().isNotEmpty
        ? SitterJobDetailAdditionalInfoItem(
            tilte: listSpecialNoteTitle[index],
            content: specialNote,
          )
        : const SizedBox.shrink();
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    var specialNote = listSpecialNote[index];
    return specialNote.trim().isNotEmpty
        ? const SizedBox(height: 12)
        : const SizedBox.shrink();
  }

  bool _stringIsNotEmptyAndNotSpace(List<String> listString) {
    if (listString.isNotEmpty) {
      var listResult = listString.where((e) {
        if (e.trim().isNotEmpty) {
          return true;
        } else {
          return false;
        }
      });
      return listResult.isNotEmpty;
    } else {
      return false;
    }
  }
}

class SitterJobDetailAdditionalInfoItem extends StatelessWidget {
  const SitterJobDetailAdditionalInfoItem({
    Key? key,
    required this.tilte,
    required this.content,
  }) : super(key: key);

  final String tilte;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          tilte,
          style: TextStyles.caption12Regular,
        ),
        const SizedBox(height: 8),
        Container(
          // height: 48,
          decoration: BoxDecoration(
            color: AppColors.grey6,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              content,
              style: TextStyles.componentTextfield,
            ),
          ),
        ),
      ],
    );
  }
}
