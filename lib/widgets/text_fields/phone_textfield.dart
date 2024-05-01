import 'package:flutter/services.dart';

import '../../l10n/generated/l10n.dart';
import 'app_textfield/app_textfield.dart';
import 'input_formatters/custom_phone_input_formatter.dart';

class PhoneTextfield extends AppTextfield {
  PhoneTextfield({
    super.key,
    PhoneTextfieldData? data,
  }) : super(
          data: data ?? PhoneTextfieldData(),
        );
}

class PhoneTextfieldData extends AppTextfieldData {
  PhoneTextfieldData({
    super.onChanged,
    super.onSubmit,
    super.onFocusLost,
    super.visibleErrors = true,
    super.autofocus,
    super.enabled,
    String? initial,
    super.nextFocus,
    super.style,
    super.debounce,
    super.keyboardType = TextInputType.number,
    String? hintText,
    bool isValidatorEnabled = true,
    // bool isMaskApplied = true,
    List<String> Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) : super(
          initial: initial ?? '',
          hintText: hintText ?? S.current.phoneNumber,
          inputFormatters: inputFormatters ?? [CustomPhoneInputFormatter()],
          validator: validator ??
              (value) {
                if (!isValidatorEnabled) return <String>[];
                return defaultValidator(value);
              },
        );

  static List<String> defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return [S.current.thisFieldCantBeEmpty];
    } else if (value.length != 15) {
      return [S.current.incorrectNumberOfCharactersPhoneNumber];
    }
    return [];
  }
}
