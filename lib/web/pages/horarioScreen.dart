import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HorarioScreen extends StatefulWidget {
  const HorarioScreen({super.key});

  @override
  State<HorarioScreen> createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  List<int> aforos = [];
  //List<String> UIDs = [];

  void obtenerAforo() async {
    var db = FirebaseFirestore.instance;
    db.collection("clases").get().then(
          (querySnapshot) async {
        for (var docSnapshot in querySnapshot.docs) {
          final FirebaseFirestore db = FirebaseFirestore.instance;
          final CollectionReference clases = db.collection('clases');
          final DocumentSnapshot snapshot = await clases.doc(docSnapshot.id).get();
          final userFields = snapshot.data() as Map<String, dynamic>;
          //print(userFields["aforo"]);
          //UIDs.add(docSnapshot.id);
          print(aforos);
          setState(() {
            aforos.add(userFields["aforo"]);
          });
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    super.initState();
    obtenerAforo();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(
          title: Text(
            'Revisa nuestros horarios de clases',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: Color(0xFFFDFDFD),
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/fondohorarios.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.symmetric(vertical: height * .05, horizontal: width * .015),
                child: Stack(
                  children: [
                    Container(
                      width: width * .3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/horarioC.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: width * .3,
                          height: height * .1,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "Entrenando: ${aforos[2]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: height * .05, horizontal: width * .015),
                child: Stack(
                  children: [
                    Container(
                      width: width * .3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/horarioG.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: width * .3,
                          height: height * .1,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "Entrenando: ${aforos[1]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: height * .05, horizontal: width * .015),
                child: Stack(
                  children: [
                    Container(
                      width: width * .3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/horarioY.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: width * .3,
                          height: height * .1,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "Entrenando: ${aforos[0]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]
        ),
      )
    );
  }
}