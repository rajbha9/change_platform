import 'dart:io';
import 'package:change_platform/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return ListView(
      children: contactProvider.contactList.map((e) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (e.pic == null)
                          ? CircleAvatar(
                              foregroundImage: AssetImage(e.assetPic!),
                              radius: 80,
                            )
                          : CircleAvatar(
                              foregroundImage: FileImage(
                                File(e.pic!),
                              ),
                              radius: 80,
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.name,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '+91 ${e.contact}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: double.infinity,
                            child: const Text('Send Message'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: double.infinity,
                              child: const Text('Cancel')),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: ListTile(
            leading: (e.pic == null)
                ? CircleAvatar(
                    radius: 30,
                    foregroundImage: AssetImage(e.assetPic!),
                  )
                : CircleAvatar(
                    radius: 30,
                    foregroundImage: FileImage(
                      File(e.pic!),
                    ),
                  ),
            title: Text(e.name),
            trailing: const Text(
              '12:28 pm',
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: const Text(
              'Flutter is Great',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      }).toList(),
    );
  }
}
