// ignore_for_file: file_names

import 'package:moment_dart/src/formatters/token.dart';
import 'package:moment_dart/src/localizations/mixins/ordinal_numbers.dart';
import 'package:moment_dart/src/localizations/mn_traditional.dart';

/// Language: Traditional Mongolian (Unicode), uses Traditional Numbers
/// Country: Mongolia
class LocalizationMongolianTraditionalNumbers
    extends LocalizationMongolianTraditional with Ordinal {
  LocalizationMongolianTraditionalNumbers() : super();

  @override
  String get languageNameInEnglish =>
      "Mongolian (Traditional Script with traditional numbers)";

  static const Map<String, String> mongolianNumbers = {
    "0": "᠐",
    "1": "᠑",
    "2": "᠒",
    "3": "᠓",
    "4": "᠔",
    "5": "᠕",
    "6": "᠖",
    "7": "᠗",
    "8": "᠘",
    "9": "᠙",
  };

  @override
  String relative(Duration duration, [bool dropPrefixOrSuffix = false]) {
    return toTraditionalNumber(super.relative(duration, dropPrefixOrSuffix));
  }

  String toTraditionalNumber(String input) {
    mongolianNumbers.forEach((key, value) {
      input = input.replaceAll(key, value);
    });

    return input;
  }

  @override
  String ordinalNumber(int n) => toTraditionalNumber(super.ordinalNumber(n));

  @override
  Map<FormatterToken, FormatterTokenFn?> get formatters => super.formatters.map(
        (key, value) => MapEntry(
          key,
          value == null
              ? null
              : (DateTime dateTime) => toTraditionalNumber(
                    value(dateTime),
                  ),
        ),
      );
}
