import 'package:flutter/material.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/view/widgets/text.dart';

class MainTextField extends StatefulWidget {
  final String hint;
  final FontWeight? fontWeight;
  final Color? colorText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int maxLines;
  final String? init;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final int? maxInputLength;

  /// it's mean hide keyboard after submit
  final bool hideKeyboard;
  final OutlineInputBorder? border;
  final Color? filledColor;
  final Color? borderColor;
  final bool enable;
  final void Function(String value)? onSubmit;
  final bool unfocusWhenTapOutside;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? onSaved;
  const MainTextField({
    this.onSaved,
    super.key,
    this.hint = '',
    this.fontWeight,
    this.colorText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.init,
    this.maxInputLength,
    this.border,
    this.isDense = true,
    this.contentPadding,
    this.filledColor = const Color(0xffF9FAFB),
    this.suffix,
    this.onSubmit,
    this.enable = true,
    this.style,
    this.hideKeyboard = false,
    this.borderColor,
    this.suffixIcon,
    this.unfocusWhenTapOutside = false,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
  });

  @override
  State<MainTextField> createState() => MainTextFieldState();
}

class MainTextFieldState extends State<MainTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void didUpdateWidget(MainTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller &&
        widget.controller != null) {
      controller = widget.controller!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorHeight: 22.0,
      enabled: widget.enable,
      maxLines: widget.maxLines,
      maxLength: widget.maxInputLength,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      style: widget.style ??
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
      onChanged: widget.onChanged,
      onTap: widget.onTap ??
          () {
            if (widget.controller != null) {
              widget.controller!.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length),
              );
            }
          },
      onTapOutside: (event) {
        if (widget.unfocusWhenTapOutside) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      decoration: InputDecoration(
        isDense: widget.isDense,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        contentPadding: widget.contentPadding,
        hintText: widget.hint.isNotEmpty ? widget.hint : null,
        hintStyle: const TextStyle(color: Colors.grey),
        border: _border(color: widget.borderColor ?? Colors.white),
        disabledBorder: _border(color: widget.borderColor ?? Colors.white),
        enabledBorder: _border(color: widget.borderColor ?? Colors.white),
        focusedBorder: _border(color: defultblue),
        errorBorder: _border(color: Colors.red),
        fillColor: widget.filledColor ?? Colors.white,
        filled: true,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder _border({required Color color}) {
    return widget.border == null
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: color),
          )
        : widget.border!.copyWith(borderSide: BorderSide(color: color));
  }
}

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: label ?? '', size: 12),
        SizedBox(height: 8),
        MainTextField(
          controller: controller,
          hint: hint ?? label ?? '',
          unfocusWhenTapOutside: true,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.all(14),
          borderColor: Colors.black.withOpacity(0.1),
          readOnly: readOnly,
          onTap: onTap,
          validator: validator ??
              (value) {
                if ((value ?? '').isEmpty) {
                  return 'This Field is required!';
                }
                return null;
              },
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
