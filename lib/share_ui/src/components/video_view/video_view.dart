// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// import '../../../shared_ui.dart';

// class VideoUrlView extends StatefulWidget {
//   const VideoUrlView({
//     super.key,
//     required this.url,
//     this.defaultHeight,
//     required this.isThumbNail,
//   });

//   final String url;
//   final double? defaultHeight;
//   final bool isThumbNail;

//   @override
//   State<VideoUrlView> createState() => _VideoUrlViewState();
// }

// class _VideoUrlViewState extends State<VideoUrlView> {
//   late VideoPlayerController _controller;
//   bool isShowPlayIcon = true;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? GestureDetector(
//             onTap: () {
//               setState(() {
//                 isShowPlayIcon = !isShowPlayIcon;
//               });
//             },
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 children: [
//                   VideoPlayer(_controller),
//                   Visibility(
//                       visible: !widget.isThumbNail &&
//                           (!_controller.value.isPlaying || isShowPlayIcon),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: GestureDetector(
//                           onTap: () {
//                             _controller.value.isPlaying
//                                 ? _controller.pause()
//                                 : _controller.play();
//                             if (_controller.value.isPlaying) {
//                               isShowPlayIcon = false;
//                             }
//                             setState(() {});
//                           },
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 height: 44,
//                                 width: 44,
//                                 decoration: BoxDecoration(
//                                     color: AppColors.white.withOpacity(0.55),
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: Center(
//                                     child: Icon(
//                                   _controller.value.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   color: AppColors.white,
//                                   size: 22,
//                                 )),
//                               ),
//                               Text(
//                                 'About me',
//                                 style: TextStyles.caption12Medium
//                                     .copyWith(color: AppColors.white),
//                               )
//                             ],
//                           ),
//                         ),
//                       ))
//                 ],
//               ),
//             ),
//           )
//         : const SizedBox();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

// class VideoFileView extends StatefulWidget {
//   const VideoFileView({super.key, required this.file});

//   final File file;

//   @override
//   State<VideoFileView> createState() => _VideoFileViewState();
// }

// class _VideoFileViewState extends State<VideoFileView> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(widget.file)
//       ..initialize().then((_) {
//         setState(() {
//           _controller.setLooping(true);
//           _controller.play();
//         });
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//         : const SizedBox();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
