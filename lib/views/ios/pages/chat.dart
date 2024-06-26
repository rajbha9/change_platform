import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../provider/contact_provider.dart';

class ChatI extends StatefulWidget {
  const ChatI({super.key});

  @override
  State<ChatI> createState() => _ChatIState();
}

class _ChatIState extends State<ChatI> {
  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return ListView(
      children: contactProvider.contactList.map((e) {
        return CupertinoListTile(
          padding: const EdgeInsets.all(10.0),
          onTap: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.white
                          .withOpacity(double.minPositive)),
                  child: (e.pic != null)
                      ? Image.file(
                          File(e.pic!),
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          e.assetPic!,
                          fit: BoxFit.cover,
                        ),
                ),
                message: Column(
                  children: [
                    Text(
                      "${e.name}\n",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "+91 ${e.contact}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {},
                    child: const Text('Send Message'),
                  ),
                  CupertinoActionSheetAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            );
          },
          leadingSize: 60,
          leading: Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: CupertinoColors.black,
            ),
            child: (e.pic != null)
                ? Image(
                    image: FileImage(File(e.pic!)),
                    fit: BoxFit.fill,
                  )
                : Image(
                    image: AssetImage(e.assetPic!),
                    fit: BoxFit.fill,
                  ),
          ),
          title: Text(
            e.name,
            // style: const TextStyle(color: CupertinoColors.darkBackgroundGray),
          ),
          trailing: const Text(
            '12:28 pm',
            // style: TextStyle(color: CupertinoColors.inactiveGray),
          ),
          subtitle: const Text(
            'Flutter is Great',
            // style: TextStyle(color: CupertinoColors.inactiveGray),
          ),
        );
      }).toList(),
    );
  }
}
