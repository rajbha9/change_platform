import 'package:flutter/cupertino.dart';

class ControllerVar {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController contactC = TextEditingController();
  ControllerVar({
    required this.nameC,
    required this.emailC,
    required this.contactC,
  });
}
