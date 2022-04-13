import 'package:flutter/material.dart';
import 'QuestionBank.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> iconsList = [];
  QuestionBank quiz = QuestionBank();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  // style: ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      quiz.NextQuestion();
                    });
                  },
                  child: Expanded(
                    flex: 1,
                    child: Text(
                      (quiz.Identifier() + 1).toString() +
                          ")  " +
                          quiz.ShowQuestions(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Container(
                child: Column(
                  children: [
                    Buttons(Colors.green, "True"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                    ),
                    Buttons(Colors.red, "False"),
                  ],
                ),
              ),
              Row(

                children: iconsList,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container Buttons(Color color, String txt) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 40, 0, 40)),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: () {
            setState(() {
              if(txt=='True')
              {
                if (quiz.ShowAnswer()==true)
              {
                iconsList.add(Icon(
                  Icons.check,
                  color: Colors.green,
                ),);
              }
             else  {
                iconsList.add(Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              }
              }
              else if(txt=='False')
              {
                if (quiz.ShowAnswer()==false)
              {
                iconsList.add(Icon(
                  Icons.check,
                  color: Colors.green,
                ),);
              }
             else  {
                iconsList.add(Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              }
              }
              quiz.NextQuestion();
              if (quiz.Identifier() == 0) {
                iconsList = [];
              }
            });
          },
          child: Text(txt)),
    );
  }
}
