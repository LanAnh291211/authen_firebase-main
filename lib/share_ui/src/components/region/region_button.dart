import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class RegionButton extends StatefulWidget {
  const RegionButton({super.key, this.initialValue, this.onPressed});
  final String? initialValue;
  final VoidCallback? onPressed;

  @override
  State<RegionButton> createState() => _RegionButtonState();
}

class _RegionButtonState extends State<RegionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AppTextField(
        textFieldStyle: TextFieldStyles.primary,
        placeholder: 'Select Region',
        initialValue: widget.initialValue,
        enabled: false,
        suffix: const Svg(
          svgPath: SvgPath.arrowRight,
          color: AppColors.textPlaceholder,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
