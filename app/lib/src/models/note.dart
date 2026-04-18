class Note {
  final String id;
  final String? title;
  final String content;
  final int numberOfLines;
  final int numberOfWords;
  final int totalCharacters;
  final int totalLetters;
  final int totalDigits;
  final int totalSpecialCharacters;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.numberOfLines,
    required this.numberOfWords,
    required this.totalCharacters,
    required this.totalLetters,
    required this.totalDigits,
    required this.totalSpecialCharacters,
  });
}
