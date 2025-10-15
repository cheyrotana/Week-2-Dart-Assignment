class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  });
}

class Answer {
  final String answerChoice;
  final Question question;
  
  Answer({required this.answerChoice, required this.question});

  bool isGoodAnswer() {
    if (answerChoice != question.goodChoice) {
      return false;
    }
    return true;
  }
}

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({required this.questions, required this.answers});

  void addAnswer(userAnswer) {
    answers.add(userAnswer);
  }

  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.isGoodAnswer()) {
        score++;
      }
    }
    return score;
  }
}

main() {
  Question q1 = Question(
    title: "How many member does the Beatle have?",
    choices: ["3", "4", "5"],
    goodChoice: "4",
  );

  Question q2 = Question(
    title: "Is Phnom Penh the capital of Cambodia?",
    choices: ["Yes", "No", "Maybe"],
    goodChoice: "Yes",
  );

  Quiz myQuiz = Quiz(questions: [q1, q2], answers: []);

  myQuiz.addAnswer(Answer(answerChoice: "4", question: q1)); 
  myQuiz.addAnswer(Answer(answerChoice: "Maybe", question: q2)); 

  print("Score: ${myQuiz.getScore()} out of 2");
}
