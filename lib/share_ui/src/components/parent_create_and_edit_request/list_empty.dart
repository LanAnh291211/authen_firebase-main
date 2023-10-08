import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({Key? key, this.title, this.content, this.imgPath}) : super(key: key);
  final String? imgPath;
  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImagePath.fatherTakingCare.assetName,
                      ),
                      fit: BoxFit.contain)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (title?.isNotEmpty != null)
            Text(
              title.toString(),
              style: TextStyles.largeBody18Medium,
              textAlign: TextAlign.center,
            ),
          if (content?.isNotEmpty != null)
            Text(
              content.toString(),
              style: TextStyles.caption12Medium.copyWith(color: AppColors.grey1),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
