import 'package:string_calculator_tdd_kata/negative_number_exception.dart';

class StringCalculator {
  int add(String delimitersAndNumbers) {
    if (delimitersAndNumbers.isEmpty)
      return 0;
    else
      return getNumbersSum(delimitersAndNumbers);
  }

  int getNumbersSum(String delimitersAndNumbers) {
    int sum = 0;
    List<String> extractedNumbers =
        getNumbersSplitByDelimeter(delimitersAndNumbers);
    StringBuffer negativeNumbers = StringBuffer();
    extractedNumbers.forEach((number) {
      if (int.parse(number) < 0)
        negativeNumbers.write(number + ' ');
      else {
        if (int.parse(number) <= 1000) sum += int.parse(number);
      }
    });
    if (negativeNumbers.isNotEmpty)
      throw NegativeNumberException(
          'negatives not allowed ${negativeNumbers.toString().trim()}');
    return sum;
  }

  List<String> getNumbersSplitByDelimeter(String delimitersAndNumbers) {
    if (delimitersAndNumbers.startsWith("//")) {
      return getNumbersSplitByCustomDelimiter(delimitersAndNumbers);
    } else {
      // split numbers with delimeter as , or \n or ;
      return delimitersAndNumbers.split(RegExp("[,\n;]"));
    }
  }

  List<String> getNumbersSplitByCustomDelimiter(String delimitersAndNumbers) {
    int delimitersEnd = delimitersAndNumbers.lastIndexOf('\n');
    String rawDelimiters = delimitersAndNumbers.substring(0, delimitersEnd);
    String rawNumbers = delimitersAndNumbers.substring(delimitersEnd + 1);
    String customDelimiters = getCustomDelimiters(rawDelimiters);
    return rawNumbers.split(RegExp("($customDelimiters)"));
  }

  String getCustomDelimiters(String rawDelimiters) {
    String bracketsExtractedDelimiters =
        getDelimitersEnclosedWithinBrackets(rawDelimiters);
    if (bracketsExtractedDelimiters.isEmpty) {
      // if there is no delimiter with [delimeter] format in the custom delimiter string
      // then there is a single char delimter after // i.e at pos 2
      return rawDelimiters[2];
    }
    return bracketsExtractedDelimiters.toString();
  }

  String getDelimitersEnclosedWithinBrackets(String rawDelimiters) {
    StringBuffer extractedDelimiters = StringBuffer();
    int start = 0;
    for (int index = 0; index < rawDelimiters.length; index++) {
      var symbol = rawDelimiters[index];
      if (symbol == '[')
        start = index;
      else if (symbol == ']') {
        extractedDelimiters.write(
            getRegExpEncodedDelimiter(rawDelimiters, start, index) + '|');
      }
    }
    return extractedDelimiters.toString();
  }

  String getRegExpEncodedDelimiter(String rawDelimiters, int start, int end) {
    return RegExp.escape(rawDelimiters.substring(start + 1, end));
  }
}
