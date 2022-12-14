import 'package:flutter/material.dart';

import 'const/enums.dart';
import 'tile/card_tile.dart';
import 'tile/normal_tile.dart';

const Curve _kResizeTimeCurve = Interval(0.4, 1.0, curve: Curves.ease);

/// Used by [BuildTile.onSwiped].
typedef SwipedCallback = void Function(SwipeDirection direction);

/// Used by [BuildTile.confirmSwipe].
typedef ConfirmSwipeCallback = Future<bool?> Function(SwipeDirection direction);

typedef BackgroundBuilder = Widget Function(BuildContext context,
    SwipeDirection direction, AnimationController progress);

class BuildTile extends StatefulWidget {
  final bool isCard;
  //final BoxShadow shadow;
  final double borderRadius;
  final Color color;
  final HitTestBehavior behavior;
  final BackgroundBuilder backgroundBuilder;
  final double swipeThreshold;
  final SwipeDirection direction;
  final Duration? resizeDuration;
  final Duration movementDuration;
  final SwipedCallback onSwiped;
  final ConfirmSwipeCallback? confirmSwipe;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool swipeToTrigger;
  final bool isElevated;

  const BuildTile({
    Key? key,
    required this.child,
    required this.backgroundBuilder,
    required this.color,
    required this.swipeThreshold,
    required this.confirmSwipe,
    required this.borderRadius,
    required this.onSwiped,
    required this.direction,
    required this.resizeDuration,
    required this.movementDuration,
    required this.behavior,
    required this.padding,
    required this.isCard,
    //required this.shadow,
    required this.swipeToTrigger,
    required this.isElevated,
  }) : super(key: key);

  @override
  _BuildTileState createState() => _BuildTileState();
}

class _BuildTileState extends State<BuildTile>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController? _moveController;
  late Animation<Offset> _moveAnimation;

  AnimationController? _resizeController;
  Animation<double>? _resizeAnimation;

  double _dragExtent = 0.0;
  bool _dragUnderway = false;
  Size? _sizePriorToCollapse;

  @override
  void initState() {
    super.initState();
    _moveController =
        AnimationController(duration: widget.movementDuration, vsync: this)
          ..addStatusListener(_handleDismissStatusChanged);

    _updateMoveAnimation();
  }

  @override
  bool get wantKeepAlive =>
      _moveController?.isAnimating == true ||
      _resizeController?.isAnimating == true;

  SwipeDirection _extentToDirection(double extent) {
    if (extent == 0.0) return SwipeDirection.none;
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        return extent < 0
            ? SwipeDirection.startToEnd
            : SwipeDirection.endToStart;
      case TextDirection.ltr:
        return extent > 0
            ? SwipeDirection.startToEnd
            : SwipeDirection.endToStart;
    }
  }

  SwipeDirection get _swipeDirection => _extentToDirection(_dragExtent);

  bool get _isActive {
    return _dragUnderway || _moveController!.isAnimating;
  }

  double get _overallDragAxisExtent {
    final Size size = context.size!;
    final double threshold = widget.swipeThreshold;

    return widget.swipeToTrigger ? size.width * threshold : size.width;

    // return size.width;
  }

  void _handleDragStart(DragStartDetails details) {
    _dragUnderway = true;
    if (_moveController!.isAnimating) {
      _dragExtent =
          _moveController!.value * _overallDragAxisExtent * _dragExtent.sign;
      _moveController!.stop();
    } else {
      _dragExtent = 0.0;
      _moveController!.value = 0.0;
    }
    setState(() {
      _updateMoveAnimation();
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!_isActive || _moveController!.isAnimating) return;

    final double delta = details.primaryDelta!;
    final double oldDragExtent = _dragExtent;
    switch (widget.direction) {
      case SwipeDirection.horizontal:
        _dragExtent += delta;
        break;

      case SwipeDirection.endToStart:
        switch (Directionality.of(context)) {
          case TextDirection.rtl:
            if (_dragExtent + delta > 0) _dragExtent += delta;
            break;
          case TextDirection.ltr:
            if (_dragExtent + delta < 0) _dragExtent += delta;
            break;
        }
        break;

      case SwipeDirection.startToEnd:
        switch (Directionality.of(context)) {
          case TextDirection.rtl:
            if (_dragExtent + delta < 0) _dragExtent += delta;
            break;
          case TextDirection.ltr:
            if (_dragExtent + delta > 0) _dragExtent += delta;
            break;
        }
        break;

      case SwipeDirection.none:
        _dragExtent = 0;
        break;
    }
    if (oldDragExtent.sign != _dragExtent.sign) {
      setState(() {
        _updateMoveAnimation();
      });
    }

    if (!_moveController!.isAnimating) {
      _moveController!.value = _dragExtent.abs() / _overallDragAxisExtent;
    }
  }

  void _updateMoveAnimation() {
    final double end = _dragExtent.sign;

    // _moveAnimation = _moveController!.drive(
    //   Tween<Offset>(
    //     begin: Offset.zero,
    //     end: Offset(end, 0),
    //   ),
    // );
    final double endOffsetX =
        widget.swipeToTrigger ? end * widget.swipeThreshold : end;

    _moveAnimation = _moveController!.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: Offset(endOffsetX, 0),
      ),
    );
  }

  Future<void> _handleDismissStatusChanged(AnimationStatus status) async {
    if (status == AnimationStatus.completed && !_dragUnderway) {
      if (widget.swipeToTrigger) {
        // final SwipeDirection direction = _swipeDirection;
        // widget.onSwiped(direction);
        // _moveController!.reverse();
        _handleSwipeToTiggerAnimation();
      } else if (status == AnimationStatus.completed && !_dragUnderway) {
        if (await _confirmStartResizeAnimation() == true) {
          _startResizeAnimation();
        } else {
          _moveController!.reverse();
        }
      }
    }

    // if (status == AnimationStatus.completed && !_dragUnderway) {
    //   if (await _confirmStartResizeAnimation() == true)
    //     _startResizeAnimation();
    //   else
    //     _moveController!.reverse();
    // }
    updateKeepAlive();
  }

  Future<bool?> _confirmStartResizeAnimation() async {
    if (widget.confirmSwipe != null) {
      final SwipeDirection direction = _swipeDirection;
      return widget.confirmSwipe!(direction);
    }
    return true;
  }

  void _handleSwipeToTiggerAnimation() async {
    // assert(_moveController!.isCompleted);
    await _moveController!.reverse();
    final SwipeDirection direction = _swipeDirection;
    widget.onSwiped(direction);
  }

  void _startResizeAnimation() {
    assert(_moveController != null);
    assert(_moveController!.isCompleted);
    assert(_resizeController == null);
    assert(_sizePriorToCollapse == null);
    // if (widget.swipeToTigger) {
    //   final SwipeDirection direction = _swipeDirection;
    //   if (_moveController!.status == AnimationStatus.dismissed) {
    //     widget.onSwiped(direction);
    //   }
    // } else {
    _resizeController =
        AnimationController(duration: widget.resizeDuration, vsync: this)
          ..addListener(_handleResizeProgressChanged)
          ..addStatusListener((AnimationStatus status) => updateKeepAlive());
    _resizeController!.forward();
    setState(() {
      _sizePriorToCollapse = context.size;
      _resizeAnimation = _resizeController!
          .drive(
            CurveTween(
              curve: _kResizeTimeCurve,
            ),
          )
          .drive(
            Tween<double>(
              begin: 1.0,
              end: 0.0,
            ),
          );
    });
    // }
  }

  void _handleResizeProgressChanged() {
    if (_resizeController!.isCompleted) {
      widget.onSwiped.call(_swipeDirection);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget buildBackground =
        widget.backgroundBuilder(context, _swipeDirection, _moveController!);
    final SwipeDirection direction = widget.direction;
    final EdgeInsetsGeometry padding = widget.padding;
    final bool isCard = widget.isCard;
    //final BoxShadow shadow = widget.shadow;
    final double borderRadius = widget.borderRadius;
    final Color color = widget.color;
    final bool isElevated = widget.isElevated;

    super.build(context); // See AutomaticKeepAliveClientMixin.

    assert(debugCheckHasDirectionality(context));

    if (_resizeAnimation != null) {
      // we've been dragged aside, and are now resizing.
      assert(() {
        if (_resizeAnimation!.status != AnimationStatus.forward) {
          assert(_resizeAnimation!.status == AnimationStatus.completed);
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary(
                'A swiped SwipeableTile widget is still part of the tree.'),
            ErrorHint(
              'Make sure to implement the onSwiped handler and to immediately remove the SwipeableTile '
              'widget from the application once that handler has fired.',
            ),
          ]);
        }
        return true;
      }());

      return SizeTransition(
        sizeFactor: _resizeAnimation!,
        axis: Axis.vertical,
        child: Container(
          padding: padding,
          width: _sizePriorToCollapse!.width,
          height: _sizePriorToCollapse!.height,
          child: ClipRRect(
            borderRadius: isCard
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: buildBackground,
          ),
        ),
      );
    }

    Widget content = isCard
        ? CardTile(
            moveAnimation: _moveAnimation,
            controller: _moveController!,
            background: buildBackground,
            child: widget.child,
            direction: direction,
            padding: padding,
            //shadow: shadow,
            borderRadius: borderRadius,
            color: color,
          )
        : NormalTile(
            moveAnimation: _moveAnimation,
            controller: _moveController!,
            background: buildBackground,
            child: widget.child,
            direction: direction,
            padding: padding,
            borderRadius: borderRadius,
            color: color,
            isElevated: isElevated,
          );
    // We are not resizing but we may be being dragging in widget.direction.
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      //onHorizontalDragEnd: _handleDragEnd,
      behavior: widget.behavior,
      child: content,
    );
  }

  @override
  void dispose() {
    _moveController!.dispose();
    _resizeController?.dispose();
    super.dispose();
  }
}
