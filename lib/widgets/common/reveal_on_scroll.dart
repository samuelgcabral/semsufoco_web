import 'dart:async';

import 'package:flutter/material.dart';

class RevealOnScroll extends StatefulWidget {
  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 900),
    this.beginScale = 0.9,
    this.offsetY = 40,
    this.visibleFraction = 0.85,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double beginScale;
  final double offsetY;
  final double visibleFraction;

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late final Animation<double> _progress = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );
  ScrollPosition? _position;
  bool _triggered = false;
  Timer? _delayTimer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _triggered = true;
      _controller.value = 1;
    }
    final position = Scrollable.maybeOf(context)?.position;
    if (position != _position) {
      _position?.removeListener(_check);
      _position = position;
      _position?.addListener(_check);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_triggered || !mounted) return;
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) return;
    final top = box.localToGlobal(Offset.zero).dy;
    if (top > MediaQuery.sizeOf(context).height * widget.visibleFraction) {
      return;
    }
    _triggered = true;
    _position?.removeListener(_check);
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      _delayTimer = Timer(widget.delay, _controller.forward);
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _position?.removeListener(_check);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progress,
      child: widget.child,
      builder: (context, child) {
        final t = _progress.value;
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * widget.offsetY),
            child: Transform.scale(
              scale: widget.beginScale + (1 - widget.beginScale) * t,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
