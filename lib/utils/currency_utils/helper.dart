import 'currency.dart';

class CurrencyHelper {
  /// Return Flag (Emoji Unicode) of a given currency
  static String currencyToEmoji(Currency currency) {
    final String currencyFlag = currency.flag!;
    final int firstLetter = currencyFlag.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = currencyFlag.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}