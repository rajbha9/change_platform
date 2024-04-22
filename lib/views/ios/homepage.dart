import 'package:change_platform/provider/themeprovider.dart';
import 'package:change_platform/views/ios/pages/call.dart';
import 'package:change_platform/views/ios/pages/chat.dart';
import 'package:change_platform/views/ios/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePageIOS extends StatefulWidget {
  const HomePageIOS({super.key});

  @override
  State<HomePageIOS> createState() => _HomePageIOSState();
}

class _HomePageIOSState extends State<HomePageIOS> {
  List<String> titles = ['Chats', 'Calls', 'Settings'];
  List<Widget> allComponants = [
    const ChatI(),
    const CallI(),
    const SettingsI(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeChangeAppProvider>(context);
    var themeproviderfalse =
        Provider.of<ThemeChangeAppProvider>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Platform Conertor'),
        trailing: CupertinoSwitch(
          value: !themeprovider.isAndroid,
          onChanged: (value) {
            themeproviderfalse.changePlatform();
          },
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone_fill_arrow_down_left),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(child: allComponants[index]);
            },
          );
        },
      ),
    );
  }
}
