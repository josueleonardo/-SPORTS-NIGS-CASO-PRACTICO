import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportnigs/phone/mainScreen.dart';
import 'package:sportnigs/phone/profesorScreen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../pages/loginScreen.dart';
import '../widgets/responsiveWidget.dart';

class HomeContent extends ResponsiveWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) => DesktopHomeContent();

  @override
  Widget buildMobile(BuildContext context) => MobileHomeContent();
}

class DesktopHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/bannergym.png"),
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
                  padding: EdgeInsets.fromLTRB(width * .53, 0, width * .08, 0),
                  child: Text(
                    "ENTRENA SIN LIMITES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * .53, 0, width * .1, 0),
                  child: Text(
                    "Tu club inteligente, donde la tecnologia y el fitnes se unen",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * .60, 0, width * .12, 0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      TurnPageRoute(
                        overleafColor: Color(0xFFD99CB8),
                        animationTransitionPoint: .15,
                        transitionDuration: const Duration(milliseconds: 500),
                        reverseTransitionDuration: const Duration(milliseconds: 500),
                        builder: (context) => const Loginscreen(),
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
                            "Unete",
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
    );
  }
}

class MobileHomeContent extends StatefulWidget {
  MobileHomeContent({super.key});

  @override
  State<MobileHomeContent> createState() => _MobileHomeContentState();
}

class _MobileHomeContentState extends State<MobileHomeContent> {
  late TextEditingController MailController;
  late TextEditingController PasswordController;
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore db = FirebaseFirestore.instance;

  void initState() {
    super.initState();
    MailController = TextEditingController();
    PasswordController = TextEditingController();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: MailController.text,
          password: PasswordController.text
      );

      final docRef = db.collection("profesor").doc(userCredential.user?.uid);
      docRef.get().then(
            (DocumentSnapshot doc) {
              late Map<String, dynamic> data = {"email" : "nada"};
              if(doc.data() != null) {
                data = doc.data() as Map<String, dynamic>;
              }
          Navigator.of(context).pushReplacement(
              TurnPageRoute(
                  overleafColor: Color(0xFFD99CB8),
                  animationTransitionPoint: .15,
                  transitionDuration: const Duration(
                      milliseconds: 500),
                  reverseTransitionDuration: const Duration(
                      milliseconds: 500),
                  builder: (context) =>
                  data["email"] == userCredential.user?.email && data["email"]!=null ?
                  ProfesorScreen(clase: data["clase"], clasesUID: data["clasesUID"] ) : MainScreen()
              )
          );
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        //print('User is currently signed out!');
      } else {

        //signInWithEmailAndPassword(MailController.text, PasswordController.text);
        /*
        Navigator.of(context).push(
            TurnPageRoute(
                overleafColor: Color(0xFFD99CB8),
                animationTransitionPoint: .15,
                transitionDuration: const Duration(
                    milliseconds: 500),
                reverseTransitionDuration: const Duration(
                    milliseconds: 500),
                builder: (context) => const MainScreen()
            )
        );*/
      }
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/bannergymiphone.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * .25, 0, 0, height * .3),
                    child: Image.asset(
                      "/Users/josuearredondo/StudioProjects/sportnigs/lib/img/logo.png",
                      width: width * .75,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    height: height * .22,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(9, 9),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: height * .05,
                          width: width * .8,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child: TextField(
                                controller: MailController,
                                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Correo'),
                              )
                          ),
                        ),
                        Container(
                          height: height * .05,
                          width: width * .8,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child: TextField(
                                controller: PasswordController,
                                obscureText: true,
                                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Contraseña'),
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, height * .03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: height * .05,
                                  width: width * .4,
                                ),
                              ),
                              SizedBox(
                                width: width * .01,
                              ),
                              GestureDetector(
                                onTap: () async {

                                  signInWithEmailAndPassword(MailController.text, PasswordController.text);
                                  /*
                                  Navigator.of(context).push(
                                    TurnPageRoute(
                                        overleafColor: Color(0xFFD99CB8),
                                        animationTransitionPoint: .15,
                                        transitionDuration: const Duration(
                                            milliseconds: 500),
                                        reverseTransitionDuration: const Duration(
                                            milliseconds: 500),
                                        builder: (context) => const MainScreen()

                                      /// MainScreen(), ProfesorScreen()
                                    ),
                                  )

                                   */
                                },
                                child: Container(
                                  height: height * .05,
                                  width: width * .4,
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16) //                 <--- border radius here
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "Inicias sesion",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}