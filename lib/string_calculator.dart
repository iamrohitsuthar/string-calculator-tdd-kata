class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty)
      return 0;
    else if (numbers.length == 1)
      return int.parse(numbers);
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
