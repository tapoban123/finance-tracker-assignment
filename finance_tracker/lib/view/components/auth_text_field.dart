import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  const AuthTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late ValueNotifier<bool> obsecureText;

  @override
  void initState() {
    obsecureText = ValueNotifier(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obsecureText,
      builder:
          (context, obsecureValue, child) => TextFormField(
            controller: widget.textController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),

              suffixIcon:
                  widget.isPassword && widget.textController.text.isNotEmpty
                      ? GestureDetector(
                        onTap: () {
                          obsecureText.value = !obsecureText.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(obsecureValue ? "Show" : "Hide")],
                          ),
                        ),
                      )
                      : null,

              fillColor: Colors.black.withValues(alpha: 0.08),
              hintText: widget.hintText,
              filled: true,
            ),
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? obsecureText.value : false,
          ),
    );
  }
}
