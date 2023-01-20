class Currency {
  final String code;
  final String name;
  final String symbol;
  final String? flag;
  final int number;
  final int decimalDigits;
  final String namePlural;
  final String decimalSeparator;
  final String thousandsSeparator;
  final bool symbolOnLeft;
  final bool spaceBetweenAmountAndSymbol;

  Currency({
    required this.code,
    required this.name,
    required this.symbol,
    required this.flag,
    required this.number,
    required this.decimalDigits,
    required this.namePlural,
    required this.symbolOnLeft,
    required this.decimalSeparator,
    required this.thousandsSeparator,
    required this.spaceBetweenAmountAndSymbol,
  });

  Currency.from({required Map<String, dynamic> json})
      : code = json['code'],
        name = json['name'],
        symbol = json['symbol'],
        number = json['number'],
        flag = json['flag'],
        decimalDigits = json['decimal_digits'],
        namePlural = json['name_plural'],
        symbolOnLeft = json['symbol_on_left'],
        decimalSeparator = json['decimal_separator'],
        thousandsSeparator = json['thousands_separator'],
        spaceBetweenAmountAndSymbol = json['space_between_amount_and_symbol'];

  Map<String, dynamic> toJson() => {
    'code': code,
    'name': name,
    'symbol': symbol,
    'number': number,
    'flag': flag,
    'decimal_digits': decimalDigits,
    'name_plural': namePlural,
    'symbol_on_left': symbolOnLeft,
    'decimal_separator': decimalSeparator,
    'thousands_separator': thousandsSeparator,
    'space_between_amount_and_symbol': spaceBetweenAmountAndSymbol,
  };
}