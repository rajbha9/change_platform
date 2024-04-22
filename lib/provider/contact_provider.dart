import 'package:flutter/widgets.dart';

import '../models/contact_model.dart';
import 'controller.dart';

class ContactProvider extends ChangeNotifier{
  List<Contact> contactList = [
    Contact(
      name: 'Batman',
      contact: '98765 43210',
      email: 'bat.123@gmail.com',
      assetPic: 'assets/img/1.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Black Panther',
      contact: '78965 43210',
      email: 'panther.10@gmail.com',
      assetPic: 'assets/img/2.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Iron Man',
      contact: '78965 43210',
      email: 'iron.10@gmail.com',
      assetPic: 'assets/img/3.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Deadpool',
      contact: '78965 43210',
      email: 'deadpool@gmail.com',
      assetPic: 'assets/img/4.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Flesh',
      contact: '78965 43210',
      email: 'flesh@gmail.com',
      assetPic: 'assets/img/5.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Thor',
      contact: '78965 43210',
      email: 'thor.10@gmail.com',
      assetPic: 'assets/img/6.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Wolverine',
      contact: '78965 43210',
      email: 'Wolverine@gmail.com',
      assetPic: 'assets/img/7.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Super Man',
      contact: '78965 43210',
      email: 'superman@gmail.com',
      assetPic: 'assets/img/8.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Loki',
      contact: '78965 43210',
      email: 'loki@gmail.com',
      assetPic: 'assets/img/9.jpg',
      time: 'Yesterday,9:40 PM',
    ),
  ];

  // Add Data Provider ....

  // TextEditing Controller Obj.................
  ControllerVar convar = ControllerVar(
      nameC: TextEditingController(text: ''),
      emailC: TextEditingController(text: ''),
      contactC: TextEditingController(text: ''));

  // Add Contact Data..........



  // Gallery Pic :-------
  // String? pickImage;
  // imagePic() async {
  //   final ImagePicker picker = ImagePicker();
  //
  //   XFile? res = await picker.pickImage(source: ImageSource.gallery);
  //   String path = res!.path;
  //   pickImage = path;
  //   notifyListeners();
  // }

  // Check Fill Data Or Not ...................


}