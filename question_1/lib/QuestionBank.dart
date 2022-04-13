import 'Question.dart';
class QuestionBank {
  int _currentQuestion=0;
  List<Question> _questionBank=[
    Question("Is 2 is even?",true ),
    Question("Sunrise from west", false),
    Question("Humans have 6 finges in a hand!", false),
    Question("Dog barks", true),
    Question("Is Pakistan a islamic country?", true),
    Question("China is the world largest country?", true),
    Question("Is Dota 2 is most famous game in the world?", true),
    Question("Is Pakistan is an independent state?", true),
    Question("Smoking is good to health",false),
    Question("Its raining", false)
  ];

void NextQuestion(){
  if(_currentQuestion<_questionBank.length){
    _currentQuestion++;
    
  }
    if (_currentQuestion==_questionBank.length){
    _currentQuestion=0;
  }
  
}


String ShowQuestions()
{
return _questionBank[_currentQuestion].question;
}
bool ShowAnswer()
{
  return _questionBank[_currentQuestion].answer;
}
  int Identifier(){
      return _currentQuestion;
  }
}