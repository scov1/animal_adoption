import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/debounced.dart';
import '../../../l10n/generated/l10n.dart';

part 'textfield_data.dart';

class AppTextfield extends StatefulWidget {
  const AppTextfield({
    required this.data,
    super.key,
  });

  final AppTextfieldData data;

  @override
  AppTextfieldState createState() => AppTextfieldState();

  static List<String> defaultValidator(String? value) {
    final output = <String>[];
    if (value == null || value.trim().isEmpty) {
      output.add(S.current.thisFieldCantBeEmpty);
      return output;
    } else if (RegExp(r'^[-a-zA-Z\s]*$').hasMatch(value) && !RegExp('[a-zA-Z]').hasMatch(value)) {
      output.add(S.current.nameContainsInvalidCharacters);
      return output;
    }
    return output;
  }

  void dispose() => data.dispose();
}

class AppTextfieldState extends State<AppTextfield> {
  @override
  void initState() {
    vmodel.focusNode.addListener(
      () {
        if (mounted && vmodel.focusNode.canRequestFocus && !vmodel.focusNode.hasFocus) {
          if (widget.data.validateOnFocusLost) {
            vmodel
              ..autovalidationOn = true
              ..validate;
          }
          vmodel.onFocusLost?.call(vmodel.controller.text);
        }
      },
    );
    if (vmodel.validateOnInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vmodel.validate;
      });
    }
    super.initState();
  }

  AppTextfieldData get vmodel => widget.data;

  @override
  Widget build(BuildContext context) {
    var suffixButton = vmodel.suffixIcon;

    return ValueListenableBuilder<List<String>>(
      valueListenable: vmodel.errors,
      builder: (context, errorsList, _) {
        var fillColor = errorsList.isEmpty ? context.color.background : context.color.errorBg;
        if (vmodel.enabled == false) {
          fillColor = context.color.grey100;
        }
        var style = vmodel.style;
        style ??= context.text.s16w400.copyWith(
          color: context.color.textPrimary,
        );
        if (vmodel.enabled == false) {
          style = style.copyWith(
            color: context.color.grey700,
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: vmodel.autofocus,
              textAlign: vmodel.textAlign ?? TextAlign.left,
              textCapitalization: vmodel.textCapitalization,
              readOnly: vmodel.readonly,
              controller: vmodel.controller,
              obscureText: vmodel.obscureText,
              enableSuggestions: !vmodel.obscureText,
              autocorrect: !vmodel.obscureText,
              enabled: vmodel.enabled,
              inputFormatters: vmodel.inputFormatters,
              keyboardType: vmodel.keyboardType,
              textInputAction:
                  vmodel.nextFocus == null ? vmodel.textInputAction : TextInputAction.next,
              maxLength: vmodel.maxLength,
              minLines: vmodel.minLines,
              maxLines: vmodel.maxLines,
              focusNode: vmodel.focusNode,
              style: style,
              buildCounter: (
                context, {
                required int currentLength,
                required bool isFocused,
                required int? maxLength,
              }) {
                return const SizedBox.shrink();
              },
              decoration: InputDecoration(
                suffixText: vmodel.suffixText,
                suffixStyle: context.text.s14w400,
                suffixIcon: suffixButton?.call(errorsList.isEmpty ? null : context.color.error),
                prefixIcon:
                    vmodel.prefixIcon?.call(errorsList.isEmpty ? null : context.color.error),
                fillColor: fillColor,
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.all(17),
                hintStyle: vmodel.hintStyle ??
                    context.text.s16w400.copyWith(
                      color: context.color.grey700,
                    ),
                hintText: vmodel.hintText,
                counterText: '',
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.color.grey300,
                  ),
                  gapPadding: 0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: errorsList.isEmpty
                      ? BorderSide(
                          color: context.color.grey300,
                        )
                      : BorderSide(
                          color: context.color.error,
                        ),
                  gapPadding: 0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: errorsList.isNotEmpty ? context.color.error : context.color.accent,
                  ),
                  gapPadding: 0,
                ),
              ),
              onChanged: (value) {
                if (vmodel.autovalidationOn) vmodel.validate;

                if (vmodel._debounce == null) {
                  vmodel.onChanged?.call(value);
                } else {
                  vmodel._debounce!(
                    () {
                      vmodel.onChanged?.call(value);
                    },
                  );
                }
              },
              onTap: () => vmodel.onTap?.call(context, vmodel.controller),
              onEditingComplete: () {
                if (vmodel.validate) {
                  if (mounted && (vmodel.nextFocus?.canRequestFocus ?? false)) {
                    vmodel.nextFocus?.requestFocus();
                  } else {
                    vmodel.focusNode.unfocus();
                  }
                }
              },
              onFieldSubmitted: vmodel.onSubmit,
            ),
            if (vmodel.visibleErrors)
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: errorsList.isEmpty
                    ? const SizedBox(
                        width: double.maxFinite,
                        height: 1,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: errorsList
                              .map<Widget>(
                                (error) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        error,
                                        style: context.text.error,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ),
          ],
        );
      },
    );
  }
}
