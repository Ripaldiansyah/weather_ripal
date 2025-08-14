import 'package:flutter/material.dart';

import '../../core.dart';

class QButton extends StatefulWidget {
  const QButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.icon,
    this.sufixIcon,
    this.color,
    this.textColor,
    this.spaceBetween = false,

    this.fontSize,
    this.enabled = true,
  });
  final String label;
  final Function onPressed;
  final double? width;
  final double? height;
  final IconData? icon;
  final IconData? sufixIcon;
  final Color? color;
  final Color? textColor;
  final bool spaceBetween;
  final double? fontSize;
  final bool enabled;

  @override
  State<QButton> createState() => _QButtonState();
}

class _QButtonState extends State<QButton> {
  DateTime? lastTap;

  @override
  void didUpdateWidget(covariant QButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var widgetWidth = widget.width ?? MediaQuery.of(context).size.width;
    var widgetHeight = 46.0;
    var widgetFontSize = 14.0;
    var widgetIconSize = 24.0;

    // widgetWidth *= widget.size.scaleFactor;
    // widgetHeight *= widget.size.scaleFactor;
    // widgetFontSize *= widget.size.scaleFactor;
    // widgetIconSize *= widget.size.scaleFactor;

    widgetHeight = widget.height ?? widgetHeight;
    if (widget.enabled == false) {
      return Container(
        height: widgetHeight,
        width: widgetWidth,
        padding: EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Color(0xfff3f6f6),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget.fontSize ?? widgetFontSize,
            color:
                widget.textColor ??
                (widget.enabled ? Colors.white : const Color(0xff797c7b)),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(color: borderColor.withAlpha(200), blurRadius: 20),
          ],
        ),
        width: widgetWidth,
        height: widgetHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            backgroundColor: widget.enabled
                ? (widget.color ?? Colors.white)
                : const Color(0xfff3f6f6),
          ),
          onPressed: () async {
            // if (await isTapProtected()) return;
            widget.enabled ? widget.onPressed() : {};
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: widgetIconSize, color: Colors.white),
                if (widget.label.isNotEmpty) const SizedBox(width: 6),
              ],
              if (widget.spaceBetween && widget.icon != null) const Spacer(),
              if (widget.icon == null)
                Expanded(
                  child: Text(
                    widget.label,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.fontSize ?? widgetFontSize,
                      color:
                          widget.textColor ??
                          (widget.enabled
                              ? componentColor
                              : const Color(0xff797c7b)),
                    ),
                  ),
                ),
              if (widget.icon != null)
                Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.fontSize ?? widgetFontSize,
                    color: Colors.white,
                  ),
                ),
              if (widget.spaceBetween && widget.sufixIcon != null)
                const Spacer(),
              if (widget.sufixIcon != null) ...[
                Icon(
                  widget.sufixIcon,
                  size: widgetIconSize,
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
              ],
            ],
          ),
        ),
      );
    }
  }
}
