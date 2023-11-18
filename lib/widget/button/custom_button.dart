import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Size minSize;
  final bool showIcon;
  final Widget? icon;
  final double elevation;
  final Color? shadowColor;
  final bool showOutline;
  final Color borderColor;
  final double? outlineWidth;
  final bool requireBorderColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.color,
    required this.fontColor,
    required this.fontSize,
    this.showIcon = false,
    required this.fontWeight,
    required this.minSize,
    this.elevation = 0,
    this.icon,
    required this.onPressed,
    this.shadowColor,
    this.title = "",
    this.showOutline = false,
    this.outlineWidth,
    this.borderColor = Colors.white,
    this.requireBorderColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showOutline
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                width: outlineWidth ?? 1.0,
                color: borderColor,
                style: BorderStyle.solid,
              ),
            ),
            child: SizedBox(
              height: minSize.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  showIcon
                      ? Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: icon!,
                        )
                      : Container(),
                  SizedBox(
                    width: showIcon ? 5 : 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 3, right: 3),
                    child: AutoSizeText(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: fontColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          fontFamily: "Roboto-Light"),
                    ),
                  ),
                ],
              ),
            ))
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: elevation,
              shadowColor: shadowColor ?? const Color(0xFFFAFAFA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: color,
              minimumSize: minSize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showIcon
                    ? Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: icon!,
                      )
                    : Container(),
                SizedBox(
                  width: showIcon ? 5 : 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 3, right: 3),
                  child: AutoSizeText(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        fontFamily: "Roboto-Light"),
                  ),
                ),
              ],
            ),
          );
  }
}
