import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// simplified copy of flutter Text class
class DecoratedText extends StatelessWidget {
  const DecoratedText(
    this.text, {
    super.key,
    this.style,
    this.textScaleFactor,
    this.blurAngle,
    this.blurColor,
  });

  final String text;
  final TextStyle? style;
  final double? textScaleFactor;
  final double? blurAngle;
  final Color? blurColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedRichText(
      textScaleFactor: textScaleFactor ?? MediaQuery.textScaleFactorOf(context),
      text: TextSpan(
        text: text,
        style: style ?? DefaultTextStyle.of(context).style,
      ),
      blurColor: blurColor,
      blurAngle: blurAngle,
    );
  }
}

// extended flutter RichText
class DecoratedRichText extends RichText {
  DecoratedRichText({
    super.key,
    required super.text,
    super.textAlign = TextAlign.start,
    super.textDirection,
    super.softWrap = true,
    super.overflow = TextOverflow.clip,
    super.textScaleFactor = 1.0,
    super.maxLines,
    super.locale,
    super.strutStyle,
    super.textWidthBasis = TextWidthBasis.parent,
    super.textHeightBehavior,
    super.selectionRegistrar,
    super.selectionColor,
    this.blurColor,
    this.blurAngle,
  });

  final double? blurAngle;
  final Color? blurColor;

  @override
  DecoratedRenderParagraph createRenderObject(BuildContext context) {
    return DecoratedRenderParagraph(
      text,
      textAlign: textAlign,
      textDirection: textDirection ?? Directionality.of(context),
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      locale: locale,
      registrar: selectionRegistrar,
      selectionColor: selectionColor,
      blurAngle: blurAngle,
      blurColor: blurColor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, DecoratedRenderParagraph renderObject) {
    renderObject
      ..text = text
      ..textAlign = textAlign
      ..textDirection = textDirection ?? Directionality.of(context)
      ..softWrap = softWrap
      ..overflow = overflow
      ..textScaleFactor = textScaleFactor
      ..maxLines = maxLines
      ..strutStyle = strutStyle
      ..textWidthBasis = textWidthBasis
      ..textHeightBehavior = textHeightBehavior
      ..locale = locale
      ..registrar = selectionRegistrar
      ..selectionColor = selectionColor
      ..blurAngle = blurAngle
      ..blurColor = blurColor;
  }
}

class DecoratedRenderParagraph extends RenderParagraph {
  DecoratedRenderParagraph(
    super.text, {
    super.textAlign = TextAlign.start,
    required super.textDirection,
    super.softWrap = true,
    super.overflow = TextOverflow.clip,
    super.textScaleFactor = 1.0,
    super.maxLines,
    super.locale,
    super.strutStyle,
    super.textWidthBasis = TextWidthBasis.parent,
    super.textHeightBehavior,
    super.children,
    super.selectionColor,
    super.registrar,
    this.blurAngle,
    this.blurColor,
  });

  double? blurAngle;
  Color? blurColor;

  @override
  void paint(PaintingContext context, Offset offset) {
    final Rect rectOuter = offset & size;
    final double angleRad = (blurAngle ?? 0) * pi / 180;
    final skewMatrix = Matrix4.skewX(angleRad);

    context.canvas.save();
    context.canvas.transform(skewMatrix.storage);
    context.canvas.translate(-rectOuter.bottom * tan(angleRad), 0);
    context.canvas.saveLayer(
      rectOuter,
      Paint()
        ..imageFilter = ImageFilter.blur(sigmaX: 2, sigmaY: 1)
        ..colorFilter =
            ColorFilter.mode((blurColor ?? Colors.grey), BlendMode.srcATop),
    );
    super.paint(context, offset);
    context.canvas.restore();
    context.canvas.restore();
    super.paint(context, offset);
  }
}
