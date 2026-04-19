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

  factory Note.fromContent({
    required String id,
    String? title,
    required String content,
  }) {
    final lines = content.split('\n');
    final words = content.trim().split(RegExp(r'\s+'));
    final characters = content.length;
    final letters = content.replaceAll(RegExp(r'[^A-Za-z]'), '').length;
    final digits = content.replaceAll(RegExp(r'[^0-9]'), '').length;
    final specialCharacters = content
        .replaceAll(RegExp(r'[A-Za-z0-9\s]'), '')
        .length;

    return Note(
      id: id,
      title: title,
      content: content,
      numberOfLines: lines.length,
      numberOfWords: words.length,
      totalCharacters: characters,
      totalLetters: letters,
      totalDigits: digits,
      totalSpecialCharacters: specialCharacters,
    );
  }
}
