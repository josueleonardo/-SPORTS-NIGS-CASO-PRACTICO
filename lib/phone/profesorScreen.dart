import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sportnigs/web/webMenu.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
class ProfesorScreen extends StatefulWidget {
  final String clase;
  final String clasesUID;

  const ProfesorScreen({Key? key, required this.clase, required this.clasesUID}) : super(key: key);

  @override
  State<ProfesorScreen> createState() => _ProfesorScreenState();
}

class _ProfesorScreenState extends State<ProfesorScreen> {
  late Map<String, dynamic> data = {"email": "nada"};
  late String uid = widget.clasesUID;

  late int aforo = 0;

  void obtenerAforo() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final CollectionReference clases = db.collection('clases');
    final DocumentSnapshot snapshot = await clases.doc(widget.clasesUID).get();
    final userFields = snapshot.data() as Map<String, dynamic>;
    setState(() {
      aforo = userFields["aforo"];
    });
  }

  void reiniciarAforo() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final CollectionReference clases = db.collection('clases');
    await clases.doc(widget.clasesUID).update({"aforo" : 0});
    //final userFields = snapshot.data() as Map<String, dynamic>;
    //aforo = userFields["aforo"];
    setState(() {
      aforo = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    obtenerAforo();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    setState(() {
      obtenerAforo();
    });

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

    String clase = widget.clase;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          clase == "CROSSFIT"
              ? 'CROSSFIT'
              : clase == "GYM"
              ? 'GYM'
              : 'YOGA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: height / width * 11,
            color: clase == "CROSSFIT" ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: clase == "CROSSFIT"
            ? Color(0xFF324645)
            : clase == "GYM"
            ? Color(0xFFF3B9C8)
            : Color(0xFFC9BBD5),
      ),
      body: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                clase == "CROSSFIT"
                    ? "/Users/josuearredondo/StudioProjects/sportnigs/lib/img/crossfitV.png"
                    : clase == "GYM"
                    ? "/Users/josuearredondo/StudioProjects/sportnigs/lib/img/gymV.png"
                    : "/Users/josuearredondo/StudioProjects/sportnigs/lib/img/yogaV.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: QrImageView(
                  data: uid,
                  size: 300,
                ),
              ),
              Container(
                color: Colors.white,
                width: width * .7,
                child: Center(
                  child: Text(
                    "Tienes un aforo de $aforo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / width * 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  color: Colors.white,
                  width: width * .7,
                  child: Center(
                    child: Text(
                      "Terminar clase",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height / width * 10,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                onTap: () => reiniciarAforo(),
              ),
              SizedBox(height: height * .0125),
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
                        color: clase == "CROSSFIT"
                            ? Color(0xFF324645)
                            : clase == "GYM"
                            ? Color(0xFFF3B9C8)
                            : Color(0xFFC9BBD5),
                      ),
                    ),
                  ),
                ),
                onTap: () => _signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
