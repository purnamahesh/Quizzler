import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.grey[900],
        ),
        home: SafeArea(child: Quizzler()),
      ),
    );

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  _QuizzlerState() {
    createList();
  }
  void reset() {
    score = count = 0;
    scoreKeeper.clear();
  }

  List<bool> answers = [
    false,
    false,
    true,
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    true,
    false,
    false,
    true,
    true,
    false,
    false
  ];
  List<String> questions = [
    'Electrons are larger than molecules',
    'The Atlantic Ocean is the biggest ocean on Earth',
    'The chemical make up food often changes when you cook it',
    'Sharks are mammals',
    'The human body has four lungs',
    'Atoms are most stable when their outer shells are full',
    'Filtration separates mixtures based upon their particle size',
    'Venus is the closest planet to the Sun',
    'Conductors have low resistance',
    'Molecules can have atoms from more than one chemical element',
    'Water is an example of a chemical element',
    'The study of plants is known as botany',
    'Mount Kilimanjaro is the tallest mountain in the world',
    'Floatation separates mixtures based on density',
    'Herbivores eat meat',
    'Atomic bombs work by atomic fission',
    'Molecules are chemically bonded',
    'Spiders have six legs',
    'Kelvin is a measure of temperature',
    'The human skeleton is made up of less than 100 bones',
    'The capital of Libya is Benghazi',
    'Albert Einstein was awarded the Nobel Prize in Physics',
    'Baby koalas are called joeys',
    'Gone with the Wind takes place in Savannah in Georgia',
    'Brazil is the only country in the Americas whose official language is Portuguese',
    'The first name of Kramer in Seinfeld is Cosmo',
    'The American Civil War ended in 1776',
    'A right triangle can never be equilateral',
    'The Ford Edsel was named after Henry Ford\'s father',
    'The Dickens novel Oliver Twist begins with the well-known phrase: "It was the best of times it was the worst of times"',
    '"Paprika" is the Hungarian word for "pepper"',
    'The Bill of Rights contains 10 amendments to the Constitution',
    'Snow White\'s seven dwarfs all worked as lumberjacks',
    'The name Sylvia Plath was a pseudonym',
    'There are seven red stripes in the United States flag',
    'The favorite food of the Teenage Mutant Ninja Turtles is pizza',
    'No bird can fly backwards',
    'Freddy Kreuger is the villain in the "Friday the 13th" movies'
  ];
  List<Questions> QaA = [];
  void createList() {
    for (int i = 0; i < 38; i++) {
      QaA.add(Questions(questions[i], answers[i]));
    }
  }

  List<Icon> scoreKeeper = [];
  int questionNo = Random().nextInt(38), count = 0, score = 0, gameNo = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.height) * 0.7,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Center(
              child: Text(
                QaA[questionNo].q,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (QaA[questionNo].a) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    score++;
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  QaA.removeAt(questionNo);
                  questionNo = Random().nextInt(QaA.length);
                  count++;
                  if (count == 10) {
                    Alert(
                        context: context,
                        title: 'Completed',
                        desc: 'Score : $score/10',
                        buttons: [
                          DialogButton(
                            child: Text('Restart'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ]).show();
                    reset();
                    gameNo++;
                    if (gameNo % 3 == 0) {
                      QaA.clear();
                      createList();
                      questionNo = Random().nextInt(38);
                    }
                  }
                });
                if (QaA.length == 0) createList();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: FlatButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              color: Colors.redAccent,
              onPressed: () {
                setState(() {
                  if (QaA[questionNo].a) {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    score++;
                  }
                  QaA.removeAt(questionNo);
                  questionNo = Random().nextInt(QaA.length);
                  count++;
                  if (count == 10) {
                    Alert(
                        context: context,
                        title: 'Completed',
                        desc: 'Score : $score/10',
                        buttons: [
                          DialogButton(
                            child: Text('Restart'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ]).show();
                    reset();
                    gameNo++;
                    if (gameNo % 3 == 0) {
                      QaA.clear();
                      createList();
                      questionNo = Random().nextInt(38);
                    }
                  }
                });
              },
            ),
          ),
        ),
        Container(
          height: 25,
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}

class Questions {
  String q;
  bool a;
  Questions(String que, bool ans) {
    q = que;
    a = ans;
  }
}
