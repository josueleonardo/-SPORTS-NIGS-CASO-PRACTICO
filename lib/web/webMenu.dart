import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sportnigs/web/widgets/navBar.dart';

import 'content/homeContent.dart';

final homeKey = new GlobalKey();
final featureKey = new GlobalKey();
final screenshotKey = new GlobalKey();
final contactKey = new GlobalKey();

final currentPageProvider = StateProvider<GlobalKey>((_) => homeKey);
final scrolledProvider = StateProvider<bool>((_) => false);

class MyWebPage extends HookConsumerWidget {
  void onScroll(ScrollController controller, WidgetRef ref) {
    final isScrolled = ref.read(scrolledProvider);

    if (controller.position.pixels > 5 && !isScrolled) {
      ref.read(scrolledProvider.notifier).state = true;
    } else if (controller.position.pixels <= 5 && isScrolled) {
      ref.read(scrolledProvider.notifier).state = false;
    }
  }

  void scrollTo(GlobalKey key) =>
      Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useScrollController();

    useEffect(() {
      _controller.addListener(() => onScroll(_controller, ref));
      return _controller.dispose;
    }, [_controller]);


    //double width = MediaQuery.of(context).size.width;
    //double maxWith = width > 1200 ? 1200 : width;

    ref.watch(currentPageProvider.notifier).addListener(scrollTo, fireImmediately: false);


    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Stack(
            children: [
              HomeContent(key: homeKey),
              Column(
                children: [
                  NavBar(),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}