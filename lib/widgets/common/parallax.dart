import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Parallax extends StatefulWidget {
  const Parallax({
    super.key,
    required this.child,
    this.offset = 30,
    this.smoothing = 0.14,
  });

  final Widget child;
  final double offset;
  final double smoothing;

  @override
  State<Parallax> createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax>
    with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  final ValueNotifier<double> _current = ValueNotifier(0);
  double _target = 0;
  ScrollPosition? _position;
  bool _reduceMotion = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = MediaQuery.disableAnimationsOf(context);
    final position = Scrollable.maybeOf(context)?.position;
    if (position != _position) {
      _position?.removeListener(_update);
      _position = position;
      _position?.addListener(_update);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _update(snap: true));
  }

  void _update({bool snap = false}) {
    if (!mounted) return;
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) return;
    if (_reduceMotion) {
      _target = 0;
      _current.value = 0;
      return;
    }
    final half = MediaQuery.sizeOf(context).height / 2;
    final center = box.localToGlobal(box.size.center(Offset.zero)).dy;
    _target = ((half - center) / half).clamp(-1.0, 1.0) * widget.offset;
    if (snap) {
      _current.value = _target;
    } else {
      final ticker = _ticker ??= createTicker(_tick);
      if (!ticker.isActive) ticker.start();
    }
  }

  void _tick(Duration _) {
    final next = _current.value + (_target - _current.value) * widget.smoothing;
    if ((next - _target).abs() < 0.1) {
      _current.value = _target;
      _ticker?.stop();
    } else {
      _current.value = next;
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_update);
    _ticker?.dispose();
    _current.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _current,
      child: widget.child,
      builder: (context, dy, child) =>
          Transform.translate(offset: Offset(0, dy), child: child),
    );
  }
}
