// Menggabungkan Question dan Module karena berkaitan erat
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  const Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class Module {
  final String moduleNumber;
  final String title;
  final String description;
  final String imagePath;
  const Module({
    required this.moduleNumber,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}