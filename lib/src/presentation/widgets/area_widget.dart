import 'dart:math';

import 'package:find_thing/src/domain/entities/area.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AreaWidget extends StatefulWidget {
  final double x, y, maxX, maxY, width, height, maxWidth, maxHeight;
  final Shape shape;
  final Color color;
  final Function(double, double) onMove;
  final Function(double?, double?, double?) onResize;
  final Function(Color) onColorChange;
  final Function() onTap, onLongPress;
  final bool editing;

  @override
  State<AreaWidget> createState() => AreaWidgetState();

  const AreaWidget(
      {Key? key,
      required this.x,
      required this.y,
      required this.shape,
      required this.color,
      required this.onMove,
      required this.onResize,
      required this.onColorChange,
      required this.onTap,
      required this.onLongPress,
      required this.width,
      required this.height,
      required this.maxWidth,
      required this.maxHeight,
      this.maxX = double.infinity,
      this.maxY = double.infinity, this.editing = false})
      : super(key: key);
}

class AreaWidgetState extends State<AreaWidget> {
  late double x, y, width, height;
  late Shape shape;
  late Color color;
  bool editing = false;

  @override
  void initState() {
    x = widget.x;
    y = widget.y;
    width = widget.width;
    height = widget.height;
    shape = widget.shape;
    color = widget.color;
    editing = widget.editing;
    super.initState();
  }

  turnOnEdit() {
    setState(() {
      editing = true;
    });
  }

  turnOffEdit() {
    setState(() {
      editing = false;
    });
  }

  setColor(Color color) {
    setState(() {
      this.color = color;
    });
    widget.onColorChange(color);
  }

  @override
  Widget _buildShape(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(Size(
          width.clamp(100, MediaQuery.of(context).size.width),
          height.clamp(100, MediaQuery.of(context).size.height))),
      decoration: BoxDecoration(
          color: widget.color.withOpacity(.5),
          shape: shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle,
          border: Border.all(color: color)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        constraints: BoxConstraints.loose(Size(
            width.clamp(100, MediaQuery.of(context).size.width),
            height.clamp(100, MediaQuery.of(context).size.height))),
        child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.loose,
            key: Key(Uuid().v1()),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: widget.onTap,
                  onLongPress: widget.onLongPress,
                  child: editing ? Draggable(
                      ignoringFeedbackSemantics: false,
                      feedback: _buildShape(context),
                      child: _buildShape(context),
                      childWhenDragging: Container(),
                      onDragEnd: (details) {
                        double dx = details.offset.dx;
                        double dy = details.offset.dy -
                            Scaffold.of(context).appBarMaxHeight!;

                        setState(() {
                          x = dx;
                          y = dy;
                        });
                        widget.onMove(x, y);
                      }
                      ) : _buildShape(context),
                ),
              ),
              ...editing ? _buildCorners(context) : []
            ]),
      ),
    );
  }

  List<Widget> _buildCorners(context) {
    return [
      // LEFT TOP
      CornerPoint(
          left: 0,
          top: 0,
          onMove: (details) {
            double dx = details.offset.dx;
            double dy =
                details.offset.dy - Scaffold.of(context).appBarMaxHeight!;

            double newWidth = width;
            double newHeight = height;
            double newY = dy;
            double newX = dx;

            newWidth += x - dx;
            if (x + width < dx + 100) {
              newX = x + width - 100;
              newWidth = 100;
            }
            double offset = y - dy;
            newHeight += offset;
            if (y + height < dy + 100) newY = y + height - 100;

            setState(() {
              width = newWidth;
              height = newHeight;
              y = newY;
              x = newX;
            });
            if (height < 100) height = 100;
            if (width < 100) width = 100;
            widget.onResize(height, width, 0);
            widget.onMove(x, y);
          }),
      // RIGHT TOP
      CornerPoint(
          right: 0,
          top: 0,
          onMove: (details) {
            double dx = details.offset.dx;
            double dy =
                details.offset.dy - Scaffold.of(context).appBarMaxHeight!;

            double newWidth = width;
            double newHeight = height;
            double newY = dy;

            if (dx > x) newWidth = Point(x, y).distanceTo(Point(dx, y));

            double offset = y - dy;
            newHeight += offset;
            if (y + height < dy + 100) newY = y + height - 100;

            setState(() {
              width = newWidth;
              height = newHeight;
              y = newY;
            });
            if (height < 100) height = 100;
            if (width < 100) width = 100;
            widget.onResize(height, width, 0);
            widget.onMove(x, y);
          }),
      // LEFT BOTTOM
      CornerPoint(
          left: 0,
          bottom: 0,
          onMove: (details) {
            double dx = details.offset.dx;
            double dy =
                details.offset.dy - Scaffold.of(context).appBarMaxHeight!;

            double newWidth = width;
            double newHeight = height;
            double newX = dx;

            newWidth += x - dx;
            if (x + width < dx + 100) {
              newX = x + width - 100;
              newWidth = 100;
            }
            newHeight = Point(x, y).distanceTo(Point(x, dy));


            setState(() {
              width = newWidth;
              height = newHeight;
              x = newX;
            });
            if (height < 100) height = 100;
            if (width < 100) width = 100;
            widget.onResize(height, width, 0);
            widget.onMove(x, y);
          }),
      // RIGHT BOTTOM
      CornerPoint(
          right: 0,
          bottom: 0,
          onMove: (details) {
            double dx = details.offset.dx;
            double dy = details.offset.dy - Scaffold.of(context).appBarMaxHeight!;

            double newWidth = width;
            double newHeight = height;

            if (dx > x) newWidth = Point(x, y).distanceTo(Point(dx, y));

            newHeight = Point(x, y).distanceTo(Point(x, dy));

            setState(() {
              width = newWidth;
              height = newHeight;
            });
            if (height < 100) height = 100;
            if (width < 100) width = 100;
            widget.onResize(width, height, 0);
          }),
    ];
  }
}

class CornerPoint extends StatelessWidget {
  final double maxX, maxY, minX, minY;
  final double? left, top, right, bottom;
  final Function(DraggableDetails) onMove;

  const CornerPoint(
      {Key? key,
      this.maxX = double.infinity,
      this.maxY = double.infinity,
      this.minX = double.infinity,
      this.minY = double.infinity,
      required this.onMove,
      this.left,
      this.top,
      this.right,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Draggable(
        child: _child(context),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          onMove(details);
        },
        feedback: _child(context),
      ),
    );
  }

  Widget _child(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      constraints: BoxConstraints.loose(const Size(15, 15)),
    );
  }
}
