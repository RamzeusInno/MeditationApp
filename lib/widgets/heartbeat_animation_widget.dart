import 'package:meditation_app/providers/flag_provider.dart';
import 'package:meditation_app/providers/selectedSessionProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeartbeatAnimation extends ConsumerStatefulWidget {
  @override
  _HeartbeatAnimationState createState() => _HeartbeatAnimationState();
}

class _HeartbeatAnimationState extends ConsumerState<HeartbeatAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    final duration = ref.read(selectedSessionNotifierProvider).getPeriodDuration();

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _scaleAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.0, end: 1.5),
          weight: 1.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.5, end: 1.0),
          weight: 1.0,
        ),
      ]
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  if (ref.watch(flagNotifierProvider)) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
    
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: const Icon(
            size: 100,
            Icons.favorite,
            color: Colors.red,
          ),
        );
      },
    );
  }
}