import 'dart:io';

class Question {
  String text;
  List<String> options;
  int correctIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class Quiz {
  List<Question> questions;
  int currentIndex;
  int score;

  Quiz(this.questions)
      : currentIndex = 0,
        score = 0;

  bool hasNextQuestion() {
    return currentIndex < questions.length;
  }

  void moveToNextQuestion() {
    currentIndex++;
  }

  Question getCurrentQuestion() {
    return questions[currentIndex];
  }

  void checkAnswer(int userAnswer) {
    if (userAnswer == getCurrentQuestion().correctIndex) {
      score++;
    }
  }
}

void main() {
  Question question1 = Question(
      text: 'What is the color of an apple?',
      options: ['Yellow', 'Purple', 'Red'],
      correctIndex: 2);
  Question question2 = Question(
      text: 'What is the color of a banana?',
      options: ['Yellow', 'Purple', 'Red'],
      correctIndex: 0);
  Question question3 = Question(
      text: 'What is the color of a grape?',
      options: ['Yellow', 'Purple', 'Red'],
      correctIndex: 1);

  List<Question> questions = [question1, question2, question3];
  Quiz quiz = Quiz(questions);

  print('Welcome to the quiz!');

  for (int i = 0; i < quiz.questions.length; i++) {
    Question currentQuestion = quiz.getCurrentQuestion();
    print('\nQuestion: ${currentQuestion.text}');
    for (int j = 0; j < currentQuestion.options.length; j++) {
      print('${j + 1}. ${currentQuestion.options[j]}');
      
    }

    stdout.write('Enter your answer (1-${currentQuestion.options.length}): ');
    String userInput = stdin.readLineSync()!;
    int userAnswer = int.parse(userInput) - 1;

    quiz.checkAnswer(userAnswer);
    quiz.moveToNextQuestion();
  }

  print('\nQuiz Finished!');
  print('Your score is: ${quiz.score}/${quiz.questions.length}');
}
