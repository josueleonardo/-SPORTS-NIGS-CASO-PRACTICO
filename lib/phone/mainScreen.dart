import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportnigs/phone/scanScreen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../web/webMenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future<void> _signOut() async {

      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        TurnPageRoute(
          overleafColor: Color(0xFFD99CB8),
          animationTransitionPoint: .15,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          builder: (context) => MyWebPage(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title:  Text(
            '¿Que vamos a entrenar hoy?',
            style: TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize:  height / width * 11,
            ),
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                TurnPageRoute(
                    overleafColor: Color(0xFFD99CB8),
                    animationTransitionPoint: .15,
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration: const Duration(milliseconds: 500),
                    builder: (context) => const ScanScreen()
                ),
              ),
              child: Container(
                height: height * .25,
                width: width * .8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/crossfit.jpg"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8) //                 <--- border radius here
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Center(
                    child: Text(
                      "CrossFit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height / width * 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                TurnPageRoute(
                    overleafColor: Color(0xFFD99CB8),
                    animationTransitionPoint: .15,
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration: const Duration(milliseconds: 500),
                    builder: (context) => const ScanScreen()
                ),
              ),
              child: Container(
                height: height * .25,
                width: width * .8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/gym.jpg"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8) //                 <--- border radius here
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Text(
                    "GYM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / width * 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                TurnPageRoute(
                    overleafColor: Color(0xFFD99CB8),
                    animationTransitionPoint: .15,
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration: const Duration(milliseconds: 500),
                    builder: (context) => const ScanScreen()
                ),
              ),
              child: Container(
                height: height * .25,
                width: width * .8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/yoga.jpg"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8) //                 <--- border radius here
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(110, 150, 0, 0),
                  child: Text(
                    "YOGA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / width * 35,
                      color: Colors.white,
                    ),
                  ),
                )
              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white,
                width: width * .7,
                child: Center(
                  child: Text(
                    "Cerrar sesión",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / width * 10,
                    ),
                  ),
                ),
              ),
              onTap: () => _signOut(),
            ),
            /*
            QrImageView(
              data: "Esto tiene que ser un json",
              size: 200,
            ),
             */
          ],
        ),
      ),
    );
  }
}