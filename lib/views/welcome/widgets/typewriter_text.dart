import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({super.key});

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  final List<RichText> texts = [
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Smart\n',
            style: TextStyle(
              color: Color(0xffD99022),
            ),
          ),
          TextSpan(
            text: 'every\n',
          ),
          TextSpan(
            text: 'Step ',
            style: TextStyle(
              color: Color(0xffD99022),
            ),
          ),
          TextSpan(text: 'of \nthe way')
        ],
      ),
    ),
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Smart\n',
            style: TextStyle(
              color: Color(0xffD99022),
            ),
          ),
          TextSpan(
            text: 'Solutions\nfor ',
          ),
          TextSpan(
            text: 'Modern\n',
            style: TextStyle(
              color: Color(0xffD99022),
            ),
          ),
          TextSpan(text: 'Life')
        ],
      ),
    ),
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Discover\n',
            style: TextStyle(
              color: Color(0xffD99022),
            ),
          ),
          TextSpan(
            text: 'and\n',
          ),
          TextSpan(
            text: 'Navigate\n',
            style: TextStyle(
              color: Color(0xffD99022),
            ),
          ),
          TextSpan(text: 'Jakarta')
        ],
      ),
    ),
  ];

  int _currentTextIndex = 0;
  Timer? _timer;
  String _displayedText = '';
  int _textLength = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _startAnimationLoop(); // Run this method when initiated
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Start the animation loop for typewriter animation
  void _startAnimationLoop() {
    //! Edit animation duration here
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) return; // Check if the widget is still mounted

      setState(() {
        if (_isPaused) {
          return;
        }

        _textLength++;
        final currentTextPlain = _getCurrentTextPlain();
        if (_textLength > currentTextPlain.length) {
          _isPaused = true;
          Future.delayed(const Duration(seconds: 1), () {
            if (!mounted) return; // Check if the widget is still mounted
            setState(() {
              _isPaused = false;
              _textLength = 0;
              _currentTextIndex = (_currentTextIndex + 1) % texts.length;
              _displayedText = '';
            });
          });
        } else {
          _displayedText = currentTextPlain.substring(0, _textLength);
        }
      });
    });
  }

  // Get the text from textspan
  String _getCurrentTextPlain() {
    final buffer = StringBuffer();
    texts[_currentTextIndex].text.visitChildren((span) {
      if (span is TextSpan) {
        buffer.write(span.text);
      }
      return true;
    });
    return buffer.toString();
  }

  TextSpan _getCurrentTextSpan() {
    final buffer = StringBuffer();
    List<TextSpan> spanList = [];
    int count = 0;
    texts[_currentTextIndex].text.visitChildren((span) {
      if (span is TextSpan) {
        buffer.write(span.text);
        if (buffer.length > _displayedText.length) {
          int remaining = _displayedText.length - count;
          spanList.add(TextSpan(
              text: span.text!.substring(0, remaining), style: span.style));
          return false;
        } else {
          spanList.add(span);
          count += span.text!.length;
        }
      }
      return true;
    });

    return TextSpan(
      children: spanList,
      //! Edit this to style the whole text span
      style: TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _getCurrentTextSpan(),
    );
  }
}
