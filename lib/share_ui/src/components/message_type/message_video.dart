import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../shared_ui.dart';

class MessageVideo extends StatefulWidget {
  const MessageVideo({
    super.key,
    required this.url,
    required this.mySelf,
  });

  final String url;
  final bool mySelf;
  @override
  State<MessageVideo> createState() => _MessageVideoState();
}

class _MessageVideoState extends State<MessageVideo>
    with AutomaticKeepAliveClientMixin<MessageVideo> {
  VideoPlayerController _controller = VideoPlayerController.network('');
  bool isShowIcon = true;
  bool loading = false;
  Future<void> init() async {
    _controller = VideoPlayerController.network(widget.url)
      ..addListener(() {
        if (_controller.value.position == _controller.value.duration) {
          setState(() {
            isShowIcon = true;
            _controller.seekTo(const Duration(seconds: 0));
          });
        }
      })
      ..initialize().then((_) {
        setState(() {
          loading = false;
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: widget.mySelf ? AppColors.grey5 : AppColors.secondaryShade8,
            borderRadius: BorderRadius.only(
              topLeft: widget.mySelf
                  ? const Radius.circular(8)
                  : const Radius.circular(2),
              topRight: widget.mySelf
                  ? const Radius.circular(2)
                  : const Radius.circular(8),
              bottomLeft: const Radius.circular(8),
              bottomRight: const Radius.circular(8),
            )),
        child: GestureDetector(
          onTap: () {
            if (!_controller.value.isInitialized) {
              setState(() {
                loading = true;
                isShowIcon = !isShowIcon;
              });
              init();
            } else {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
              setState(() {
                isShowIcon = !isShowIcon;
              });
            }
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Visibility(
                    visible: !loading && isShowIcon,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                                color: AppColors.black.withOpacity(0.55),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child: Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                              size: 22,
                            )),
                          ),
                        ],
                      ),
                    )),
                Visibility(
                  visible: loading,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !loading && isShowIcon,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          '${formatNumber(_controller.value.duration.inMinutes)}:${formatNumber(_controller.value.duration.inSeconds)}',
                          style: TextStyles.caption12Regular
                              .copyWith(color: AppColors.white),
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  @override
  bool get wantKeepAlive => true;
}
