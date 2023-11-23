import 'package:flutter/material.dart';
import 'package:season/src/view/widgets/text.dart';

class SelectInput extends FormField<String> {
  final String? currentValue;
  final String? label;
  final String? hint;
  final String? validatorText;
  final void Function(String? value)? onChanged;
  final List<String> items;
  final Widget? icon;
  SelectInput({
    Key? key,
    this.currentValue,
    this.label,
    this.hint,
    this.validatorText,
    FormFieldValidator<String>? validator,
    this.onChanged,
    required this.items,
    this.icon,
  }) : super(
          key: key,
          validator: validator ??
              (value) {
                if ((currentValue ?? '').isEmpty) {
                  return validatorText ?? 'This Field is required!';
                }
                return null;
              },
          onSaved: onChanged,
          initialValue: currentValue,
          builder: (FormFieldState<String> state) {
            Color color =
                currentValue == null ? Colors.black26 : Colors.black87;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: label ?? '', size: 12),
                SizedBox(height: 8),
                PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) {
                    return items.map<PopupMenuItem<String>>((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Container(
                          width: 200,
                          child: CustomText(
                            text: value,
                            color: value == currentValue
                                ? Colors.black87
                                : Colors.black38,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  onSelected: (String? value) {
                    state.didChange(value);
                    onChanged!(value);
                  },
                  child: Container(
                    height: 46,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: state.hasError
                              ? Color(0xFFFF0000)
                              : Colors.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icon ?? SizedBox(),
                        icon != null ? SizedBox(width: 8) : SizedBox(),
                        Expanded(
                          child: CustomText(
                            text: currentValue ?? hint ?? label ?? '',
                            color: color,
                            maxLines: 1,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: color),
                      ],
                    ),
                  ),
                ),
                (state.hasError && state.errorText != null)
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        child: CustomText(
                          text: state.errorText ?? '',
                          color: Color(0xFFC50000),
                          size: 12,
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 8),
              ],
            );
          },
        );
}
