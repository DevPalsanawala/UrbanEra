import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final isButtonEnabled = RxBool(false);
  final showError = RxBool(false);
  final isPhoneNumber = RxBool(false);
  RxString mobileNumber = ''.obs;
  TextEditingController mobileNumberController = TextEditingController();
  RxInt selectedIndex = (0).obs;

  void selectCountry(int index) {
    selectedIndex.value = index;
  }

  final List<Map<String, String>> countries = [
    {"name": "Afghanistan", "code": "+93", "flag": "assets/flags/af.png"},
    {"name": "Albania", "code": "+355", "flag": "assets/flags/al.png"},
    {"name": "Argentina", "code": "+54", "flag": "assets/flags/ar.png"},
    {"name": "Australia", "code": "+61", "flag": "assets/flags/au.png"},
    {"name": "Austria", "code": "+43", "flag": "assets/flags/at.png"},
    {"name": "Bangladesh", "code": "+880", "flag": "assets/flags/bd.png"},
    {"name": "Belgium", "code": "+32", "flag": "assets/flags/be.png"},
    {"name": "Brazil", "code": "+55", "flag": "assets/flags/br.png"},
    {"name": "Canada", "code": "+1", "flag": "assets/flags/ca.png"},
    {"name": "China", "code": "+86", "flag": "assets/flags/cn.png"},
    {"name": "Colombia", "code": "+57", "flag": "assets/flags/co.png"},
    {"name": "Czech Republic", "code": "+420", "flag": "assets/flags/cz.png"},
    {"name": "Denmark", "code": "+45", "flag": "assets/flags/dk.png"},
    {"name": "Egypt", "code": "+20", "flag": "assets/flags/eg.png"},
    {"name": "Finland", "code": "+358", "flag": "assets/flags/fi.png"},
    {"name": "France", "code": "+33", "flag": "assets/flags/fr.png"},
    {"name": "Germany", "code": "+49", "flag": "assets/flags/de.png"},
    {"name": "Greece", "code": "+30", "flag": "assets/flags/gr.png"},
    {"name": "India", "code": "+91", "flag": "assets/flags/in.png"},
    {"name": "Indonesia", "code": "+62", "flag": "assets/flags/id.png"},
    {"name": "Iran", "code": "+98", "flag": "assets/flags/ir.png"},
    {"name": "Italy", "code": "+39", "flag": "assets/flags/it.png"},
    {"name": "Japan", "code": "+81", "flag": "assets/flags/jp.png"},
    {"name": "Kenya", "code": "+254", "flag": "assets/flags/ke.png"},
    {"name": "Mexico", "code": "+52", "flag": "assets/flags/mx.png"},
    {"name": "Netherlands", "code": "+31", "flag": "assets/flags/nl.png"},
    {"name": "New Zealand", "code": "+64", "flag": "assets/flags/nz.png"},
    {"name": "Nigeria", "code": "+234", "flag": "assets/flags/ng.png"},
    {"name": "Norway", "code": "+47", "flag": "assets/flags/no.png"},
    {"name": "Pakistan", "code": "+92", "flag": "assets/flags/pk.png"},
    {"name": "Peru", "code": "+51", "flag": "assets/flags/pe.png"},
    {"name": "Philippines", "code": "+63", "flag": "assets/flags/ph.png"},
    {"name": "Poland", "code": "+48", "flag": "assets/flags/pl.png"},
    {"name": "Portugal", "code": "+351", "flag": "assets/flags/pt.png"},
    {"name": "Russia", "code": "+7", "flag": "assets/flags/ru.png"},
    {"name": "Saudi Arabia", "code": "+966", "flag": "assets/flags/sa.png"},
    {"name": "South Africa", "code": "+27", "flag": "assets/flags/za.png"},
    {"name": "South Korea", "code": "+82", "flag": "assets/flags/kr.png"},
    {"name": "Spain", "code": "+34", "flag": "assets/flags/es.png"},
    {"name": "Sweden", "code": "+46", "flag": "assets/flags/se.png"},
    {"name": "Switzerland", "code": "+41", "flag": "assets/flags/ch.png"},
    {"name": "Thailand", "code": "+66", "flag": "assets/flags/th.png"},
    {"name": "Turkey", "code": "+90", "flag": "assets/flags/tr.png"},
    {"name": "Ukraine", "code": "+380", "flag": "assets/flags/ua.png"},
    {"name": "United Kingdom", "code": "+44", "flag": "assets/flags/gb.png"},
    {"name": "United States", "code": "+1", "flag": "assets/flags/us.png"},
    {"name": "Vietnam", "code": "+84", "flag": "assets/flags/vn.png"},
    {"name": "Zimbabwe", "code": "+263", "flag": "assets/flags/zw.png"},
  ];
}