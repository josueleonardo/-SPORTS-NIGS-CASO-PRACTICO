import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import 'horarioScreen.dart';

class ClasesScreen extends StatefulWidget {
  const ClasesScreen({super.key});

  @override
  State<ClasesScreen> createState() => _ClasesScreenState();
}

class _ClasesScreenState extends State<ClasesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: Container(
        //margin: const EdgeInsets.symmetric(vertical: 20),
        height: height,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/crossfit.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end  ,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .60, 0, width * .08, 0),
                          child: Text(
                            "CROSSFIT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .65, 0, width * .08, 0),
                          child: Text(
                             "\"No se trata de ser el mejor, sino de ser mejor que ayer.\"",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .78, 0, width * .08, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              TurnPageRoute(
                                overleafColor: Color(0xFFD99CB8),
                                animationTransitionPoint: .15,
                                transitionDuration: const Duration(milliseconds: 500),
                                reverseTransitionDuration: const Duration(milliseconds: 500),
                                builder: (context) => const HorarioScreen(),
                              ),
                            ),
                            child: Container(
                              height: height * .08,
                              width: width * .15,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.pinkAccent,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16) //                 <--- border radius here
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                    "Horarios",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/gym.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end  ,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0, 0, width * .78, 0),
                          child: Text(
                            "GYM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .08, 0, width * .65, 0),
                          child: Text(
                            "\"Transforma tu cuerpo, fortalece tu mente.\"",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .05, 0, width * .75, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              TurnPageRoute(
                                overleafColor: Color(0xFFD99CB8),
                                animationTransitionPoint: .15,
                                transitionDuration: const Duration(milliseconds: 500),
                                reverseTransitionDuration: const Duration(milliseconds: 500),
                                builder: (context) => const HorarioScreen(),
                              ),
                            ),
                            child: Container(
                              height: height * .08,
                              width: width * .15,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.pinkAccent,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16) //                 <--- border radius here
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                    "Horarios",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/yoga.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end  ,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .60, 0, width * .1, 0),
                          child: Text(
                            "YOGA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .65, 0, width * .08, 0),
                          child: Text(
                            "\"Flexibilidad no solo del cuerpo, sino también de la mente.\"",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * .78, 0, width * .08, 0),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              TurnPageRoute(
                                overleafColor: Color(0xFFD99CB8),
                                animationTransitionPoint: .15,
                                transitionDuration: const Duration(milliseconds: 500),
                                reverseTransitionDuration: const Duration(milliseconds: 500),
                                builder: (context) => const HorarioScreen(),
                              ),
                            ),
                            child: Container(
                              height: height * .08,
                              width: width * .15,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.pinkAccent,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16) //                 <--- border radius here
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                    "Horarios",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}