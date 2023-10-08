import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../shared_ui.dart';

class MessageVoice extends StatefulWidget {
  const MessageVoice({
    super.key,
    required this.url,
    required this.mySelf,
  });

  final String url;
  final bool mySelf;

  @override
  State<MessageVoice> createState() => _MessageVoiceState();
}

class _MessageVoiceState extends State<MessageVoice> with AutomaticKeepAliveClientMixin<MessageVoice> {
  final _player = AudioPlayer();
  bool initilazed = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  bool get wantKeepAlive => true;

  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(_player.positionStream, _player.bufferedPositionStream,
      _player.durationStream, (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero));

  Future<void> _init() async {
    _player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stackTrace) {
      debugPrint('A stream error occurred: $e');
    });

    _player.playerStateStream.listen((playerState) {
      switch (playerState.processingState) {
        case ProcessingState.ready:
          setState(() {
            initilazed = true;
            loading = false;
          });
          break;
        case ProcessingState.completed:
          _player.stop();
          _player.seek(const Duration(seconds: 0));
          setState(() {});
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: BoxDecoration(
          color: widget.mySelf ? AppColors.grey5 : AppColors.secondaryShade8,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          )),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Svg(
                svgPath: SvgPath.microphone2,
                color: widget.mySelf ? AppColors.labelTertiary : AppColors.secondaryDefault,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '${formatNumber(_player.duration?.inMinutes.toInt() ?? 0)}:${formatNumber(_player.duration?.inSeconds.toInt() ?? 0)}',
                style: TextStyles.componentColumnContent.copyWith(color: AppColors.black),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    disabledActiveTrackColor: widget.mySelf ? AppColors.grey3 : AppColors.secondaryShade50,
                    disabledInactiveTrackColor: AppColors.white,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                    trackShape: CustomTrackShape(),
                  ),
                  child: StreamBuilder<PositionData>(
                    stream: _positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;

                      return Slider(
                          thumbColor: widget.mySelf ? AppColors.textTertiary : AppColors.secondaryDefault,
                          min: 0,
                          max: positionData?.duration?.inSeconds.toDouble() ?? 0,
                          value: positionData?.bufferedPosition?.inSeconds.toDouble() ?? 0,
                          onChanged: null);
                    },
                  ),
                ),
              ),
              Visibility(
                  visible: loading,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                  )),
              Visibility(
                visible: !loading,
                child: IconButton(
                  onPressed: () async {
                    try {
                      if (_player.processingState == ProcessingState.idle) {
                        setState(() {
                          loading = !loading;
                        });
                        await _player.setAudioSource(AudioSource.uri(Uri.parse(widget.url))).then((value) => null);
                        _player.play();
                      } else if (_player.processingState == ProcessingState.ready) {
                        _player.playing ? _player.pause() : _player.play();
                      }
                    } catch (e) {
                      debugPrint('Error loading audio source: $e');
                    }
                  },
                  icon: Svg(
                    svgPath: _player.playing ? SvgPath.pause : SvgPath.play,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  @override
  void dispose() {
    super.dispose();

    _player.dispose();
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop - 2, trackWidth, 10);
  }
}

class PositionData {
  Duration? position;
  Duration? bufferedPosition;
  Duration? duration;
  PositionData(
    this.bufferedPosition,
    this.position,
    this.duration,
  );
}
