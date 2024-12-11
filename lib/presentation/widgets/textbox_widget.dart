import 'package:flutter/material.dart';

class TextBoxWidget extends StatefulWidget {
  final String text;
  final IconData icon;
  final IconData? suffixIcon;
  final Widget? suffix;
  final TextEditingController controller;
  final Function() onChanged;
  final bool? obscureText;

  const TextBoxWidget(
      {super.key,
      required this.text,
      required this.icon,
      this.suffixIcon,
      this.suffix,
      required this.controller,
      required this.onChanged,
      this.obscureText});

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller = TextEditingController(text: widget.controller.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: widget.obscureText ?? false,
            controller: _controller,

            onChanged: widget.onChanged(),

            decoration: InputDecoration(
              suffix: widget.suffix,
              prefixIcon: Icon(widget.icon),
              suffixIcon: Icon(widget.suffixIcon),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            // controller: ,
            // initialValue: ,
          ),
        ],
      ),
    );
  }
}
