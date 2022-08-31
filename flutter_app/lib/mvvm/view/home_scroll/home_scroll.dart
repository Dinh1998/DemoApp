import 'package:flutter/material.dart';

class ScrollTapView extends StatefulWidget {
  const ScrollTapView({Key? key}) : super(key: key);
  @override
  State<ScrollTapView> createState() => _ScrollTapViewState();
}

class _ScrollTapViewState extends State<ScrollTapView> {
  List<GlobalKey> listKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<String> nameTittle = [
    'UP',
    'BETWEEN',
    'DOWN',
    'OTHER',
    'OTHER 1',
  ];
  late ScrollController scrollController;
  late RenderBox box;
  late BuildContext tabContext;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(changeTabs);
    super.initState();
  }
  // @override
  // void dispose(){
  //   scrollController.dispose();
  //   super.dispose();
  // }

  scrollTo(int index) async {
    scrollController.removeListener(changeTabs);
    final i = listKey[index].currentContext!;
    await Scrollable.ensureVisible(i,
      duration: const Duration(milliseconds: 300),
    );
    scrollController.addListener(changeTabs);
  }

  changeTabs() {
    for (var i = 0; i < listKey.length; i++) {
      box = listKey[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext)!.animateTo(i,
          duration: const Duration(milliseconds: 50),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: nameTittle.length,
        child: Builder(
          builder: (context) {
            tabContext = context;
            return Scaffold(
              appBar: AppBar(
                leading: const BackButton(color: Colors.red),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  )
                ],
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      ' S C R O L L',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                bottom: TabBar(
                  onTap: (int index) {
                    scrollTo(index);
                  },
                  isScrollable: true,
                  tabs: nameTittle
                      .asMap().map((i, value) => MapEntry(i, Tab(
                    child: Text(value),
                  ))).values.toList(),
                ),
              ),
              body: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        containerCustomIndex(
                            text: "UP:",
                            index: 0,
                            color: Colors.red,
                            height: 200),
                        containerCustomIndex(
                            text: "BETWEEN  ",
                            index: 1,
                            color: Colors.blue,
                            height: 300),
                        containerCustomIndex(
                            text: "DOWN ",
                            index: 2,
                            color: Colors.green,
                            height: 400),
                        containerCustomIndex(
                            text: "OTHER",
                            index: 3,
                            color: Colors.blue,
                            height: 600),
                        containerCustomIndex(
                            text: "OTHER1",
                            index: 4,
                            color: Colors.yellow,
                            height: 600),

                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget containerCustomIndex(
      {required String text,
        required int index,
        required Color color,
        required double height}) {
    return Container(
      key: listKey[index],
      color: color,
      height: height,
      width: double.infinity,
      child: Text(text),
    );
  }
}
