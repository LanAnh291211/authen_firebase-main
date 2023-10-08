import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class SpeacialNoteForm extends StatefulWidget {
  const SpeacialNoteForm({
    Key? key,
    required this.reasonTextController,
    required this.childLoveTextController,
    required this.appriciateSitterController,
  }) : super(key: key);
  final TextEditingController reasonTextController;
  final TextEditingController childLoveTextController;
  final TextEditingController appriciateSitterController;
  @override
  State<SpeacialNoteForm> createState() => _SpeacialNoteFormState();
}

class _SpeacialNoteFormState extends State<SpeacialNoteForm> {
  bool isShow = false;

  showForm() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => showForm(),
          child: Row(
            children: [
              const Text(
                'Special notes (Optional)',
                style: TextStyles.largeBody18SemiBold,
              ),
              isShow ? const Svg(svgPath: SvgPath.directionUp) : const Svg(svgPath: SvgPath.directionDown)
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          'Help us understand your needs better!',
          style: TextStyles.smallBody16Regular.copyWith(color: AppColors.textSecondary),
        ),
        Visibility(
          visible: isShow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 8),
                child: Text(
                  'I need a sitter because...',
                  style: TextStyles.smallBody16Regular,
                ),
              ),
              AppTextField(
                placeholder: 'Let us understand the nature of the job',
                textFieldStyle: TextFieldStyles.primary,
                controller: widget.reasonTextController,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 8),
                child: Text(
                  'My child/children loves....',
                  style: TextStyles.smallBody16Regular,
                ),
              ),
              AppTextField(
                placeholder: 'Cars? Books? Crayons?',
                textFieldStyle: TextFieldStyles.primary,
                controller: widget.childLoveTextController,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 8),
                child: Text(
                  'I appreciate when my sitter...',
                  style: TextStyles.smallBody16Regular,
                ),
              ),
              AppTextField(
                placeholder: 'Help your sitter better care for your child',
                textFieldStyle: TextFieldStyles.primary,
                controller: widget.appriciateSitterController,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
