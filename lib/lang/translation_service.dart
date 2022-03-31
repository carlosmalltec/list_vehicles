import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us.dart';
import 'pt_br.dart';

class TranslationService extends Translations {
  static Locale? get locale => Locale('pt','BR'); 
  // static Locale? get locale => Get.deviceLocale; //Identifica a lingagem do dispositivo
  static final fallbackLocale = Locale('pt', 'BR');
  // static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'pt_BR': pt_BR,
      };
}
//https://countrycode.org/