import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd_kata/string_calculator.dart';

void main() {
  test(
    'Given an empty string, when an add operation is performed, then 0 is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add(""), 0);
    },
  );

  test(
    'Given a one number string, when an add operation is performed, then that number is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add("1"), 1);
    },
  );

  test(
    'Given a two numbers string, when an add operation is performed, then sum of that two numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add("1,2"), 3);
    },
  );

  test(
    'Given a mutliple numbers string, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add("1,2,3,4,5,6,7,8,9,10"), 55);
    },
  );

  test(
    'Given a numbers string with \n or , as a seperator, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add("1\n2,3"), 6);
    },
  );

  test(
    'Given a numbers string with custom separator, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add("//;\n1;2"), 3);
    },
  );
}
