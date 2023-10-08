import 'package:flutter/cupertino.dart';

import '../../colors/colors.dart';
import '../../text_styles/text_styles.dart';

class SwitchSettingItem extends StatefulWidget {
  const SwitchSettingItem({
    Key? key,
    required this.title,
    required this.value,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final bool value;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onChanged;

  @override
  State<SwitchSettingItem> createState() => _SwitchSettingItemState();
}

class _SwitchSettingItemState extends State<SwitchSettingItem> {
  late bool value;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 31,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: TextStyles.smallBody16Regular,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              value ? 'On' : 'Off',
              style: TextStyles.smallBody16Regular.copyWith(
                color: value ? AppColors.tintGreen : AppColors.grey3,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(width: 8),
            CupertinoSwitch(
              value: value,
              activeColor: AppColors.tintGreen,
              trackColor: AppColors.grey3,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                  widget.onChanged?.call(value);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
