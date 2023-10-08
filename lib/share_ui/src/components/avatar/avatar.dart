import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../paths/paths.dart';
import '../svg/svg.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.imageUrl,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String? imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl != '') {
      return AspectRatio(
        aspectRatio: 1,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: fit,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(Icons.error),
              );
            },
          ),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 1,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey6,
            border: Border.all(color: AppColors.otherStroke),
          ),
          child: const Center(
            child: SizedBox(
              width: 34,
              height: 34,
              child: Svg(
                svgPath: SvgPath.profileCircleOutline,
                color: AppColors.textPlaceholder,
              ),
            ),
          ),
        ),
      );
    }
  }
}

class FileAvatar extends StatelessWidget {
  const FileAvatar({
    super.key,
    required this.file,
    this.fit = BoxFit.cover,
  });

  final File file;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroundTertiary,
        ),
        child: Image.file(
          file,
          fit: fit,
        ),
      ),
    );
  }
}
