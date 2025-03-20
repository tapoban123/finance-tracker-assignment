import 'package:flutter/material.dart';

class _ObsecureTextValues {
  final bool obsecureValue;
  final bool showIcon;

  const _ObsecureTextValues({
    required this.obsecureValue,
    required this.showIcon,
  });

  _ObsecureTextValues copyWith({bool? obsecureValue, bool? showIcon}) {
    return _ObsecureTextValues(
      obsecureValue: obsecureValue ?? this.obsecureValue,
      showIcon: showIcon ?? this.showIcon,
    );
  }
}

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
  late ValueNotifier<_ObsecureTextValues> obsecureText;

  @override
  void initState() {
    obsecureText = ValueNotifier(
      _ObsecureTextValues(obsecureValue: true, showIcon: false),
    );

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
                          obsecureText.value = obsecureValue.copyWith(
                            obsecureValue: !obsecureText.value.obsecureValue,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                obsecureValue.obsecureValue ? "Show" : "Hide",
                              ),
                            ],
                          ),
                        ),
                      )
                      : null,

              fillColor: Colors.black.withValues(alpha: 0.08),
              hintText: widget.hintText,
              filled: true,
            ),
            onChanged: (value) {
              final bool showIcon;

              if (value.isNotEmpty) {
                showIcon = true;
              } else {
                showIcon = false;
              }
              obsecureText.value = obsecureText.value.copyWith(
                showIcon: showIcon,
              );
            },
            keyboardType: widget.keyboardType,
            obscureText:
                widget.isPassword ? obsecureText.value.obsecureValue : false,
          ),
    );
  }
}
