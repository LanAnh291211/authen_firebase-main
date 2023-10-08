// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class CreateRequestSitterItem extends StatelessWidget {
  const CreateRequestSitterItem({
    Key? key,
    this.onSelected,
    this.onCallProfileView,
    required this.isSelected,
    required this.fullName,
    required this.salaryPerHour,
    required this.profilePicture,
    required this.address,
    required this.starSitterBadge,
    required this.review,
  }) : super(key: key);
  final bool isSelected;
  final String fullName;
  final double? salaryPerHour;
  final String? profilePicture;
  final String? address;
  final double? starSitterBadge;
  final int? review;
  final VoidCallback? onSelected;
  final VoidCallback? onCallProfileView;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      decoration: const BoxDecoration(boxShadow: BoxShadows.card, color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _avatarSitter(),
            const SizedBox(
              width: 7,
            ),
            _inforSitter(),
            GestureDetector(
              onTap: onSelected,
              child: SitterSelectButton(
                isSelected: isSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatarSitter() => GestureDetector(
        onTap: onCallProfileView,
        child: SizedBox(
          width: 65,
          height: 65,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 57,
                width: 57,
                child: Avatar(
                  imageUrl: profilePicture,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _inforSitter() => Expanded(
        child: GestureDetector(
          onTap: onCallProfileView,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.largeBody18SemiBold,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'S\$${salaryPerHour}',
                  style: TextStyles.smallBody16Regular.copyWith(color: AppColors.primary, overflow: TextOverflow.ellipsis),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' /hour',
                      style: TextStyles.smallBody16Regular.copyWith(color: AppColors.textTertiary, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.tintYellow,
                    size: 15,
                  ),
                  Expanded(
                    child: Text(' ${starSitterBadge} (${review} reviews)',
                        overflow: TextOverflow.ellipsis, style: TextStyles.caption10Regular.copyWith(color: AppColors.textTertiary)),
                  ),
                ],
              ),
              Row(
                children: [
                  const Svg(
                    svgPath: SvgPath.locationOn,
                    color: AppColors.tintBlue,
                    height: 15,
                  ),
                  Expanded(
                    child: Text(
                      '$address',
                      style: TextStyles.caption10Regular.copyWith(color: AppColors.textTertiary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
