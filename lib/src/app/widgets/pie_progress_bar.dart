import 'package:flutter/material.dart';
import 'package:heodat/core/config/my_theme.dart';
import 'package:heodat/core/utils/extensions/int_extensions.dart';
import 'package:vector_math/vector_math.dart' as vm;

class PieProgressBar extends StatefulWidget {
  /// Creates a rounded pie progress bar
  const PieProgressBar(
      {super.key, this.size = 50, this.color = Colors.blue, this.progress = 0});

  ///Size of widget
  final double size;

  //Color of widget
  final Color color;

  ///Between 0 to 100
  final int progress;
  @override
  State<PieProgressBar> createState() => _PieProgressBarState();
}

class _PieProgressBarState extends State<PieProgressBar>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<int> animation;
  late Tween<int> animationTween;

  @override
  void initState() {
    if (widget.progress < 0 || widget.progress > 100) {
      throw Exception('Progress must be between 0 to 100');
    }
    setAnimation(0, widget.progress);
    super.initState();
  }

  @override
  void didUpdateWidget(PieProgressBar oldWidget) {
    if (oldWidget.progress != widget.progress) {
      setAnimation(oldWidget.progress, widget.progress);
    }
    super.didUpdateWidget(oldWidget);
  }

  setAnimation(int begin, int end) {
    animationController = AnimationController(
        vsync: this, duration: ((end - begin).abs() * 20).miliSeconds);
    animationController.reset();
    animationTween = IntTween(begin: begin, end: end);
    animation = animationTween.animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.size * 0.3),
        border: Border.all(
            color: theme(context).textTheme.bodyMedium?.color ?? Colors.black,
            width: 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.size * 0.245),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: Transform.scale(
                scale: 2,
                child: CustomPaint(
                    painter: _PieChartPainter(
                        progress: animation.value, color: widget.color)),
              ),
            ),
          ),
          Container(
            width: widget.size * 0.25,
            height: widget.size * 0.25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
                border: Border.all(color: Colors.white, width: 2)),
          ),
        ],
      ),
    );
  }
}

class _PieChartPainter extends CustomPainter {
  int progress;
  Color color;

  _PieChartPainter({required this.color, this.progress = 0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint()..color = color;
    var angle = progress / 100 * 360;
    canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height),
        vm.radians(-90), vm.radians(angle), true, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
