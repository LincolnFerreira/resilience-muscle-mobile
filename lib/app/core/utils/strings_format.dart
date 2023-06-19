String? initialLetterUpperCase(String? word) {
  if (word != null) {
    String firstLetterUpperCase = word.substring(0, 1).toUpperCase();
    String restLetter = word.substring(1);
    return firstLetterUpperCase + restLetter;
  }
  return null;
}
