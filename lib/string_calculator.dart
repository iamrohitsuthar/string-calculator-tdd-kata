class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty)
      return 0;
    else {
      int sum = 0;
      List<String> numbersList;
      if (numbers.startsWith("//")) {
        String separator = numbers[2];
        numbersList =
            numbers.substring(numbers.indexOf("\n") + 1).split(separator);
      } else {
        numbersList = numbers.split(RegExp("[,\n]"));
      }
      numbersList.forEach((number) {
        sum += int.parse(number);
      });
      return sum;
    }
  }
}
