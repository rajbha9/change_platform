import 'package:change_platform/views/android/pages/call.dart';
import 'package:change_platform/views/android/pages/chat.dart';
import 'package:change_platform/views/android/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/themeprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: allComponants.length, vsync: this);
  }

  List<Widget> allComponants = [
    const Chat(),
    const Calls(),
    const Settings(),
  ];
  bool isNotSettings = false;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var themePro = Provider.of<ThemeChangeAppProvider>(context);
    var themeProFalse =
        Provider.of<ThemeChangeAppProvider>(context, listen: false);
    return DefaultTabController(
      length: allComponants.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Platform Conertor'),
          actions: [
            Switch(
              value: !themePro.isAndroid,
              onChanged: (value) {
                themeProFalse.changePlatform();
              },
            )
          ],
          bottom: TabBar(
            onTap: (val) {
              if (val == 2) {
                isNotSettings = true;
                setState(() {});
              } else {
                isNotSettings = false;
                setState(() {});
              }
              pageController.animateToPage(
                val,
                duration: const Duration(microseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            controller: tabController,
            tabs: const <Tab>[
              Tab(
                child: Text(
                  '    chat    ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  '     call    ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Setting',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: PageView(
            onPageChanged: (val) {
              tabController.animateTo(val);
            },
            controller: pageController,
            children: allComponants,
          ),
        ),
      ),
    );
  }
}
