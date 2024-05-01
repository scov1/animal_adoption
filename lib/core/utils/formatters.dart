import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static String customFormatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '+# ### ### ####',
    filter: {
      '#': RegExp('[0-9]'),
    },
  );
}
