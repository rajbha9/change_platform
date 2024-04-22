import 'dart:io';

import 'package:change_platform/provider/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CallI extends StatefulWidget {
  const CallI({super.key});

  @override
  State<CallI> createState() => _CallIState();
}

class _CallIState extends State<CallI> {
  @override
  Widget build(BuildContext context) {
    var contactProvider= Provider.of<ContactProvider>(context);
    return ListView(
      children: contactProvider.contactList.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: CupertinoListTile(
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
            title: Text(e.name),
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.phone_fill,
                size: 30,
                color: CupertinoColors.activeGreen,
              ),
            ),
            subtitle: Text(
              e.time,
              style: const TextStyle(color: CupertinoColors.inactiveGray),
            ),
          ),
        );
      }).toList(),
    );
  }
}
