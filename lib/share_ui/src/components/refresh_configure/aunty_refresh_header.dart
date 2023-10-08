import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide RefreshIndicator, RefreshIndicatorState;

import '../../../shared_ui.dart';

class AuntyRefreshHeader extends RefreshIndicator {
  final String? semanticsLabel;
  final String? semanticsValue;
  final Color? textColor;
  final double distance;
  final Color? backgroundColor;

  const AuntyRefreshHeader({
    Key? key,
    double height = 80.0,
    this.semanticsLabel,
    this.semanticsValue,
    this.textColor,
    double offset = 0,
    this.distance = 250.0,
    this.backgroundColor,
    Duration completeDuration = const Duration(milliseconds: 600),
  }) : super(
          key: key,
          refreshStyle: RefreshStyle.Behind,
          offset: offset,
          height: height,
          completeDuration: completeDuration,
        );

  @override
  State<StatefulWidget> createState() {
    return _AuntyRefreshHeaderState();
  }
}

class _AuntyRefreshHeaderState extends RefreshIndicatorState<AuntyRefreshHeader> with TickerProviderStateMixin {
  late ScrollPosition _position;
  late Animation<Offset> _positionFactor;
  late AnimationController _scaleFactor;
  late AnimationController _positionController;
  late AnimationController _valueAni;

  @override
  void initState() {
    _valueAni = AnimationController(vsync: this, value: 0.0, lowerBound: 0.0, upperBound: 1.0, duration: const Duration(milliseconds: 300));
    _valueAni.addListener(() {
      if (mounted && _position.pixels <= 0) setState(() {});
    });
    _positionController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _scaleFactor = AnimationController(vsync: this, value: 1.0, lowerBound: 0.0, upperBound: 1.0, duration: const Duration(milliseconds: 300));

    _positionFactor = _positionController.drive(
      Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.0, 0.0),
      ),
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AuntyRefreshHeader oldWidget) {
    _position = Scrollable.of(context).position;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void onOffsetChange(double offset) {
    if (!floating) {
      _valueAni.value = offset / configuration!.headerTriggerDistance;
      _positionController.value = offset / configuration!.headerTriggerDistance;
    }
  }

  @override
  void onModeChange(RefreshStatus? mode) {
    if (mode == RefreshStatus.refreshing) {
      _positionController.value = widget.distance / widget.height;
      _scaleFactor.value = 1;
    }
    super.onModeChange(mode);
  }

  @override
  void resetValue() {
    _scaleFactor.value = 1.0;
    _positionController.value = 0.0;
    _valueAni.value = 0.0;
    super.resetValue();
  }

  @override
  void didChangeDependencies() {
    _position = Scrollable.of(context).position;
    super.didChangeDependencies();
  }

  @override
  Future<void> readyToRefresh() {
    return _positionController.animateTo(widget.distance / widget.height);
  }

  @override
  Future<void> endRefresh() {
    return _scaleFactor.animateTo(0.0);
  }

  @override
  void dispose() {
    _valueAni.dispose();
    _scaleFactor.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus? mode) {
    return SafeArea(
      child: SlideTransition(
        position: _positionFactor,
        transformHitTests: false,
        child: pullToRefreshHeader(context, mode),
      ),
    );
  }

  Widget pullToRefreshHeader(BuildContext context, RefreshStatus? mode) {
    switch (mode) {
      case RefreshStatus.idle:
        return refreshHeader(
          'Pull down to refresh',
          childFirst: Icon(
            Icons.arrow_downward,
            color: widget.textColor,
            size: 24,
          ),
        );
      case RefreshStatus.canRefresh:
        return refreshHeader(
          'Release to refresh',
          childFirst: Icon(
            Icons.refresh,
            color: widget.textColor,
            size: 24,
          ),
        );
      case RefreshStatus.refreshing:
        return refreshHeader(
          'Refreshing...',
          childFirst: const CupertinoActivityIndicator(),
        );
      case RefreshStatus.completed:
        return refreshHeader(
          'Completed',
          childFirst: Icon(
            Icons.check,
            color: widget.textColor,
            size: 24,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget refreshHeader(String content, {Widget? childFirst}) {
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 15,
        children: [
          if (childFirst != null) ...[
            childFirst,
          ],
          Text(
            content,
            style: TextStyles.caption12Regular.copyWith(color: widget.textColor),
          ),
        ],
      ),
    );
  }
}
