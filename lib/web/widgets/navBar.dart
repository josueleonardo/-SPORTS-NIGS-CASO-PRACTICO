import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportnigs/web/pages/clasesScreen.dart';
import 'package:sportnigs/web/pages/horarioScreen.dart';
import 'package:sportnigs/web/pages/loginScreen.dart';
import 'package:sportnigs/web/widgets/responsiveWidget.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import 'navBarButton.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileNavBar();
  }
}

class DesktopNavBar extends HookConsumerWidget {
  const DesktopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isScrolled = ref.watch(scrolledProvider);
    //final navBarColor = isScrolled ? Colors.white : Colors.blue;

    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Image.asset(
              "/Users/josuearredondo/StudioProjects/sportnigs/lib/img/logo.png",
              height: 40.0,
            ),
            Expanded(child: Container()),
            NavBarButton(
              onTap: () => Navigator.of(context).push(
                TurnPageRoute(
                  overleafColor: Color(0xFFD99CB8),
                  animationTransitionPoint: .15,
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  builder: (context) => const ClasesScreen(),
                ),
              ),
              text: "Clases",
            ),
            NavBarButton(
              onTap: () => Navigator.of(context).push(
                TurnPageRoute(
                  overleafColor: Color(0xFFD99CB8),
                  animationTransitionPoint: .15,
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  builder: (context) => const HorarioScreen(),
                ),
              ),
              text: "Horarios",
            ),
            NavBarButton(
              onTap: () => _dialogBuilder(context),
              text: "Eventos",
            ),
            /*
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              tooltip: 'Inicia sesion',
              onPressed: () => Navigator.of(context).push(
                TurnPageRoute(
                  overleafColor: Color(0xFFD99CB8),
                  animationTransitionPoint: .15,
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  builder: (context) => const Loginscreen(),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return showDialog<void>(
      barrierColor: Colors.pinkAccent.withOpacity(.3),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eventos'),
          content: Container(
            width: width * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/Users/josuearredondo/StudioProjects/sportnigs/lib/img/flayer1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class MobileNavBar extends HookConsumerWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Stack(
      children: [
        /*
        AnimatedContainer(
          margin: EdgeInsets.only(top: 70.0),
          duration: Duration(milliseconds: 350),
          curve: Curves.ease,
          height: containerHeight.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBarButton(
                  text: "Inicio",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = homeKey;
                    containerHeight.value = 0;
                  },
                ),
                NavBarButton(
                  text: "Clases",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = featureKey;
                    containerHeight.value = 0;
                  },
                ),
                NavBarButton(
                  text: "Horarios",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = screenshotKey;
                    containerHeight.value = 0;
                  },
                ),
                NavBarButton(
                  text: "Contactanos",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = contactKey;
                    containerHeight.value = 0;
                  },
                ),
              ],
            ),
          ),
        ),

        Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "/Users/josuearredondo/StudioProjects/sportnigs/lib/img/logo.png",
                  height: 30.0,
                ),
                Expanded(
                  child: Container(),
                ),
                Material(
                  child: InkWell(
                    splashColor: Colors.white60,
                    onTap: () {
                      final height = containerHeight.value > 0 ? 0.0 : 240.0;
                      containerHeight.value = height;
                    },
                    child: Icon(
                      Icons.menu_sharp,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    */
      ],
    );
  }

}